from flask import Flask, jsonify, request
from flask_cors import CORS
import os
from dotenv import load_dotenv
from db_manager import DatabaseManager
from session_manager import SessionManager

# Loading in environment file
load_dotenv()

# Initializing flask app
app = Flask(__name__)

app.config['CORS_HEADERS'] = 'Content-Type'
app.config['SECRET_KEY'] = os.getenv('SECRET_KEY')

# Setting up CORS
CORS(app)

# Instantiating components
database_manager = DatabaseManager(
    sql_host=os.getenv('SQL_HOST'),
    sql_uname=os.getenv('SQL_USER'),
    sql_pw=os.getenv('SQL_PASSWD'),
    sql_db=os.getenv('SQL_DB'),
)

session_manager = SessionManager(
    secret_key=os.getenv('SECRET_KEY'),
)

# -------------- Server Routes
@app.route('/', methods=['GET'])
def root():
    '''
        Root url, to test whether the server is running
    '''
    return jsonify({"msg": "Hello There"})

@app.route('/new', methods=['GET'])
def getNewPubs():
    query = database_manager.getNewPubs()
    print(query)
    res = {
        "data": [{
            "doi": q[0],
            "title": q[1],
            "c_id": q[2],
            "published": q[3],
            "r_id": q[4],
            "authors": q[5] + " " + q[6],
        } for q in query]}

    return jsonify(res)

# --- Authentication Routes
@app.route('/login', methods=['POST'])
def login():
    email = request.get_json()['email']
    password = request.get_json()['password']

    if email == '' or password == '' or not isinstance(email, str) or not isinstance(password, str):
        return jsonify({'error': 'Invalid email or password'}), 400

    return session_manager.login(email, password, database_manager)

@app.route('/signup', methods=['POST'])
def signup():
    request_body = request.get_json()
    if request_body == {} or not isinstance(request_body, dict):
        return jsonify({'error': 'Invalid request_body'}), 400

    return session_manager.signup(request_body, database_manager)

@app.route('/verifyAuth', methods=['POST'])
@session_manager.validateJWT
def verifyAuth():
    return jsonify({'message': 'JWT Token is present. Visited Protected Route'})

# -- Profile routes
@app.route('/profile/follow', methods=['POST'])
@session_manager.validateJWT
def follow():
    try:
        request_body = request.get_json()
        follower = request_body["follower"]
        following = request_body["following"]
        res = database_manager.followUser(follower, following)
        return jsonify(res), 200

    except Exception as e:
        print("ERROR: ", e)
        return jsonify({'error': 'Invalid request'}), 400

@app.route('/profile/unfollow', methods=['POST'])
@session_manager.validateJWT
def unfollow():
    try:
        request_body = request.get_json()
        follower = request_body["follower"]
        following = request_body["following"]
        res = database_manager.unfollowUser(follower, following)
        return jsonify(res), 200

    except Exception as e:
        print("ERROR: ", e)
        return jsonify({'error': 'Invalid request'}), 400


@app.route('/profile/visit', methods=['POST'])
@session_manager.validateJWT
def visit():
    try:
        request_body = request.get_json()
        r_id = request_body['visitorOf']
        res = database_manager.pageVist(r_id)
        return jsonify(res), 200
    except Exception as e:
        print("ERROR: ", e)
        return jsonify({'error': 'Invalid request'}), 400

@app.route('/profile')
def getProfile():
    try:
        r_id = request.args.get('r_id')
        query = database_manager.getResearcher(r_id)
        res = {
            "r_id": query[0],
            "last_name": query[1],
            "first_name": query[2],
            "email": query[3],
            "h_index": query[4],
            "no_citations": query[5],
            "dob": query[6],
            "page_visits": query[7],
            "nationality": query[8]
        }
        return jsonify(res), 200
    except Exception as e:
        print("ERROR: ", e)
        return jsonify({'error': 'Invalid request'}), 400

@app.route('/papers')
def getPapers():
    try:
        r_id = request.args.get('r_id')
        query = database_manager.getPapers(r_id)
        if query == () or query[0][0] is None:
            return jsonify({"papers": []})
        res = {
            "papers": [{
                "doi": q[0],
                "domain": q[1],
                "paper_url": q[2],
                "title": q[3],
                "p_citations": q[4],
                "conf_id": q[5],
                "conf_name": q[6],
                "published_date": q[7]
            } for q in query]
        }
        return jsonify(res), 200
    except Exception as e:
        print("ERROR: ", e)
        return jsonify({'error': 'Invalid request'}), 400

@app.route('/work')
def getWork():
    r_id = request.args.get('r_id')

    query_org = database_manager.getOrganization(r_id)
    query_comp = database_manager.getCompany(r_id)
    query_uni = database_manager.getUniversity(r_id)
    res = {
        "org": query_org,
        "comp": query_comp,
        "uni": query_uni
    }
    return jsonify(res), 200

@app.route('/social')
def getSocial():
    try:
        r_id = request.args.get('r_id')
        query = database_manager.getSocial(r_id)
        res = {
            "following": [{
                "r_id": q[1],
                "last_name": q[2],
                "first_name": q[3]
            } for q in query if q[0] == "follows"],
            "followers": [{
                "r_id": q[1],
                "last_name": q[2],
                "first_name": q[3]
            } for q in query if q[0] == "follower"]
        }
        return jsonify(res), 200
    except Exception as e:
        print("ERROR: ", e)
        return jsonify({'error': 'Invalid request'}), 400

@app.route('/search')
def getSearch():
    try:
        search_key = request.args.get('s')
        query_paper = database_manager.getSearchPaper(search_key)
        query_user = database_manager.getSearchUser(search_key)

        res = {}

        if query_paper is None:
            res["papers"] = None

        else:
            res["papers"] = [{
                "doi": q[0],
                "domain": q[1],
                "title": q[2],
                "paper_url": q[3],
                "r_id": q[4],
                "first_name": q[5],
                "last_name": q[6],
                "conf_id": q[7],
                "conf_name": q[8]
            } for q in query_paper]

        if query_user is None:
            res["users"] = None
        else:
            res["users"] = [{
                "r_id": q[0],
                "first_name": q[1],
                "last_name": q[2]
            } for q in query_user]

        return jsonify(res), 200

    except Exception as e:
        print("ERROR: ", e)
        return jsonify({'error': 'Invalid request'}), 400

if __name__ == '__main__':
    app.run(debug=True)
