import psycopg2
import os

class postgres_data_inserts:
    def __init__(self, environment, port, name, user, password, infraLinksPath, vehicleSubmodesPath, routesPath):
        self.infraLinksFile = infraLinksPath
        self.vehicleSubmodesFile = vehicleSubmodesPath
        self.routesFile = routesPath
        self.dbAddress = environment
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

    def addRoutesToDb(self):
        routes = open(self.routesFile, "r").read()
        try:
            conn = psycopg2.connect(host=self.dbAddress, port=self.dbPort, database=self.dbName, user=self.dbUser, password=self.dbPassword)
            cur = conn.cursor()
            cur.execute(routes)
            conn.commit()
        except (Exception, psycopg2.DatabaseError) as error:
            print(error)
        finally:
            if conn is not None:
                conn.close()
                print('Database connection closed.')
