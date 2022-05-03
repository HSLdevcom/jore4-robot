import psycopg2
import os

class postgres_data_inserts:
    def __init__(self, environment, port, name, user, password):
        self.dbAddress = environment
        self.dbPort = port
        self.dbName = name
        self.dbUser = user
        self.dbPassword = password

    def seedDbWithFile(self, fileName):
        data = open(fileName, "r").read()
        try:
            conn = psycopg2.connect(host=self.dbAddress, port=self.dbPort, database=self.dbName, user=self.dbUser, password=self.dbPassword)
            cur = conn.cursor()
            cur.execute(data)
            conn.commit()
        except (Exception, psycopg2.DatabaseError) as error:
            print(error)
        finally:
            if conn is not None:
                conn.close()
                print('Database connection closed.')
