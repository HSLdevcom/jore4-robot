*** Settings ***
#Add this file as Resource in all test case files

#Add all robot libraries here
Library       Browser
Library       Collections
Library       RequestsLibrary
Library       BuiltIn
Library       OperatingSystem
Library       String
Library       FakerLibrary
#Here is list of all "gatherer" files
Resource        ../Resources/Resources.robot
Resource        ../Keywords/Keywords.robot
#here is list of python libraries
Library         ../Libraries/common_functions.py
Library         ../Libraries/hasura_queries.py    ${HASURA_API_URL}
Library         ../Libraries/datetime_functions.py
Library         ../Libraries/json_handlers.py
Library         ../Libraries/postgres_data_inserts.py    ${ENV}   ${TESTDB_PORT}   ${TESTDB_NAME}    ${TESTDB_USER}    ${TESTDB_PASSWORD}    ${INFRA_LINKS_FILE_PATH}    ${VEHICLE_SUBMODES_FILE_PATH}
