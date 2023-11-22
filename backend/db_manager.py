from functools import wraps
import MySQLdb
from flask import jsonify
from datetime import datetime

class DatabaseManager:
    def __init__(self, sql_host, sql_uname, sql_pw, sql_db):
        self.sql_host = sql_host
        self.sql_uname = sql_uname

        self.sql_db = MySQLdb.connect(
            host=sql_host,
            user=sql_uname,
            password=sql_pw,
            database=sql_db
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
        cur.execute(f"SELECT r_id, password FROM Researcher WHERE email='{email}'")
        return cur.fetchone(), 200

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
