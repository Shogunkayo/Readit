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

if __name__ == '__main__':
    app.run(debug=True)
