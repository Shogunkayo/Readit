from functools import wraps
import MySQLdb
from flask import jsonify
from datetime import datetime

class DatabaseManager:
    def __init__(self, sql_host, sql_uname, sql_pw, sql_db):
        self.sql_host = sql_host
        self.sql_uname = sql_uname
        self.sql_pw = sql_pw
        self.sql_db_name = sql_db

        self.sql_db = MySQLdb.connect(
            host=sql_host,
            user=sql_uname,
            password=sql_pw,
            database=sql_db
        )

    def openConnection(self):
        self.sql_db = MySQLdb.connect(
            host=self.sql_host,
            user=self.sql_uname,
            password=self.sql_pw,
            database=self.sql_db_name
        )

    def closeConnection(self):
        self.sql_db.close()

    @staticmethod
    def _sqlCursor(f):
        '''
            Decorator to handle error checking and cursor open/close
            Parameters:
                @f = function to wrap
        '''
        @wraps(f)
        def wrapper(self, *args, **kwargs):
            '''
                Wrapper function that creates a new cursor, executes the sql
                query and closes the cursor.
                Returns:
                    On success, returns the return value of @f
                    On error, returns a tuple of JSON object and status code
                JSON object:
                    @error = error message
            '''
            try:
                cur = self.sql_db.cursor()
                db_query = f(self, *args, cur, **kwargs)
                self.sql_db.commit()
                cur.close()
                return db_query

            except Exception as e:
                print(f"error executing mysql query: {e}")
                return jsonify({'error': 'Internal server error'}), 500

        return wrapper

    @_sqlCursor
    def getPassword(self, email, cur):
        cur.execute(f"SELECT r_id, password, role FROM Researcher WHERE email='{email}'")
        res = cur.fetchone()
        return res, 200

    @_sqlCursor
    def isEmailPresent(self, email, cur):
        cur.execute(f"SELECT EXISTS (SELECT 1 FROM Researcher WHERE email = '{email}')")
        return cur.fetchone()[0] == 1

    @_sqlCursor
    def createAccount(self, rid, email, password, first_name, last_name, nationality, dob, date_created, cur):
        dob = datetime.strptime(dob, '%Y-%m-%d')
        date_created = datetime.strptime(date_created, '%Y-%m-%d %H:%M:%S')

        cur.execute(f"SELECT country_id FROM Country WHERE country_name='{nationality}'")
        nationality = cur.fetchone()[0]

        cur.execute(
            f"INSERT INTO Researcher (r_id, email, password, first_name, last_name, nationality, dob, date_created) "
            f"VALUES ('{rid}', '{email}', '{password.decode('utf-8')}', '{first_name}', '{last_name}', {nationality}, '{dob}', '{date_created}')"
        )

        if cur.rowcount > 0:
            print("Insert operation successful.")
            return 200
        else:
            print("Insert operation failed.")
            return 500

    @_sqlCursor
    def followUser(self, follower, following, cur):
        cur.execute(f"INSERT INTO Follows VALUES ('{following}', '{follower}')")
        return {"msg": "Follow successful"}

    @_sqlCursor
    def unfollowUser(self, follower, following, cur):
        print(f"DELETE FROM Follows VALUES follows='{following}' AND follower='{follower}'")
        cur.execute(f"DELETE FROM Follows WHERE follows='{following}' AND follower='{follower}'")
        return {"msg": "Unfollow successful"}

    @_sqlCursor
    def pageVist(self, r_id, cur):
        cur.execute(f"UPDATE Researcher SET page_visits = page_visits + 1 WHERE r_id = '{r_id}'")
        return {"msg": "Vist counted"}

    @_sqlCursor
    def getPaperTiers(self, tier, cur):
        cur.execute(f"SELECT * FROM Paper WHERE doi IN (SELECT doi FROM Publish_Conf WHERE c_id IN (SELECT c_id FROM Conference WHERE tier='{tier}'))")
        res = cur.fetchall()
        return res

    @_sqlCursor
    def getNewPubs(self, cur):
        cur.execute("""
            SELECT
                p.doi as doi,
                p.title as title,
                c.c_id as conf_id,
                c.c_name as conf_name,
                r.r_id as r_id,
                r.first_name as first_name,
                r.last_name as last_name
            FROM Paper as p
            JOIN WritePaper pw ON pw.doi = p.doi
            JOIN Researcher r ON pw.r_id = r.r_id
            JOIN Publish_Conf pc ON pc.doi = p.doi
            JOIN Conference c ON c.c_id = pc.c_id
            WHERE c.tier = 'Tier 1'
            ORDER BY pc.date_published DESC LIMIT 5;
                    """)
        res = cur.fetchall()
        return res

    def getResearcher(self, rid):
        self.closeConnection()
        self.openConnection()
        cur = self.sql_db.cursor()
        cur.callproc("GetResearcher", [rid])
        res = cur.fetchall()
        cur.close()
        return res[0]

    def getPapers(self, rid):
        self.closeConnection()
        self.openConnection()
        cur = self.sql_db.cursor()
        cur.callproc("GetPapers", [rid])
        res = cur.fetchall()
        cur.close()
        return res

    def getSocial(self, rid):
        self.closeConnection()
        self.openConnection()
        cur = self.sql_db.cursor()
        cur.callproc("GetSocial", [rid])
        res = cur.fetchall()
        cur.close()
        return res

    def getCompany(self, rid):
        self.closeConnection()
        self.openConnection()
        cur = self.sql_db.cursor()
        cur.callproc("GetCompInfo", [rid])
        res = cur.fetchall()
        cur.close()
        if res == ():
            return None
        else:
            return {
                "comp_id": res[0][0],
                "comp_name": res[0][1],
                "comp_city": res[0][2],
                "comp_country": res[0][3]
            }

    def getUniversity(self, rid):
        self.closeConnection()
        self.openConnection()
        cur = self.sql_db.cursor()
        cur.callproc("GetUniInfo", [rid])
        res = cur.fetchall()
        cur.close()
        if res == ():
            return None
        else:
            return {
                "uni_id": res[0][0],
                "uni_name": res[0][1],
                "uni_city": res[0][2],
                "uni_country": res[0][3],
                "dep_name": res[0][4],
                "dep_id": res[0][5]
            }

    def getOrganization(self, rid):
        self.closeConnection()
        self.openConnection()
        cur = self.sql_db.cursor()
        cur.callproc("GetOrgInfo", [rid])
        res = cur.fetchall()
        cur.close()
        if res == ():
            return None
        else:
            return {
                "org_id": res[0][0],
                "org_name": res[0][1]
            }

    def getSearchPaper(self, search_key):
        self.closeConnection()
        self.openConnection()
        cur = self.sql_db.cursor()
        cur.callproc("GetSearchPapers", [search_key])
        res = cur.fetchall()
        cur.close()
        if res == ():
            return None
        else:
            return res

    def getSearchUser(self, search_key):
        self.closeConnection()
        self.openConnection()
        cur = self.sql_db.cursor()
        cur.callproc("GetSearchUsers", [search_key])
        res = cur.fetchall()
        cur.close()
        if res == ():
            return None
        else:
            return res
