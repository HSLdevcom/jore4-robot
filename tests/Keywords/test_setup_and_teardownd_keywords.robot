*** Keywords ***
suite setup for map tests
    insertDataFromSqlFile    ${INFRA_LINKS_FILE_PATH}
    insertDataFromSqlFile    ${VEHICLE_SUBMODES_FILE_PATH}
    insertDataFromSqlFile    ${ROUTES_AND_STOPS_FILE_PATH}
    log in to jore4

log in to jore4
    setup browser
    user logs in with hslid

setup browser
    New Browser    ${BROWSER}   headless=true
    New Context    viewport={'width': ${SCREEN_WITDH}, 'height': ${SCREEN_HEIGHT}}    recordVideo={'dir': '${OUTPUT_DIR}/video'}
    New Page  ${SUT_URL}

reset browser
    Delete All Cookies
    Close Browser

suite teardown
    user logs out
    reset browser

set test variables for new line
    ${today}    Date today
    Set Test Variable    ${DATE_TODAY}   ${today}
    ${label}    Pyint   max_value=9999
    Set Test Variable    ${NEW_LINE_LABEL}    ${label}
    ${name}    Street Name
    Set Test Variable    ${NEW_LINE_NAME}   ${name}
    Set Test Variable    ${NEW_LINE_PRIMARY_VEHICLE_MODE}    bus
    Set Test Variable    ${NEW_LINE_TYPE_VALUE}    regional_bus_service

set test variables for new stop
    ${stop_label}    Street Name
    Set Test Variable    ${STOP_LABEL}    ${stop_label}
    ${today}    Date today
    Set Test Variable    ${DATE_TODAY}   ${today}

set test variables for creating route
    ${line_name_and_label}    get random line name and label from hasura
    ${line_name}   Get From Dictionary   ${line_name_and_label}    name_i18n
    ${line_label}    Get From Dictionary   ${line_name_and_label}    label
    Set Test Variable    ${LINE_NAME}    ${line_name}
    Set Test Variable    ${LINE_LABEL}   ${line_label}
    ${route_name}   Street Name
    ${route_label}    Pyint   max_value=9999
    Set Test Variable    ${ROUTE_NAME}    ${route_name}
    Set Test Variable    ${ROUTE_LABEL}   ${route_label}
    ${today}    Date today
    ${tomorrow}    Date tomorrow
    Set Test Variable    ${DATE_TODAY}   ${today}
    Set Test Variable    ${DATE_TOMORROW}   ${tomorrow}
