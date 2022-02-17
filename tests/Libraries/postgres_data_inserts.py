import psycopg2
import os

class postgres_data_inserts:
    def __init__(self, environemnt, port, name, user, password, infraLinksPath, vehicleSubmodesPath):
        self.infraLinksFile = infraLinksPath
        self.vehicleSubmodesFile = vehicleSubmodesPath
        self.dbAddress = environemnt
        self.dbPort = port
        self.dbName = name
        self.dbUser = user
        self.dbPassword = password

    def addInfraLinksToDb(self):
        insertInfraLinks = open(self.infraLinksFile, "r").read()
        try:
            conn = psycopg2.connect(host=self.dbAddress, port=self.dbPort, database=self.dbName, user=self.dbUser, password=self.dbPassword)
            cur = conn.cursor()
            cur.execute(insertInfraLinks)
            conn.commit()
        except (Exception, psycopg2.DatabaseError) as error:
              print(error)
        finally:
            if conn is not None:
                conn.close()
                print('Database connection closed.')

    def addVehicleSubmodesToDb(self):
        vehicleSubmodes = open(self.vehicleSubmodesFile, "r").read()
        try:
            conn = psycopg2.connect(host=self.dbAddress, port=self.dbPort, database=self.dbName, user=self.dbUser, password=self.dbPassword)
            cur = conn.cursor()
            cur.execute(vehicleSubmodes)
            conn.commit()
        except (Exception, psycopg2.DatabaseError) as error:
              print(error)
        finally:
            if conn is not None:
                conn.close()
                print('Database connection closed.')
