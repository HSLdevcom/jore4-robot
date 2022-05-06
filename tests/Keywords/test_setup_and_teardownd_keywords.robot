*** Keywords ***
suite setup for map tests
    seedDbWithFile    ${INFRA_LINKS_FILE_PATH}
    seedDbWithFile    ${VEHICLE_SUBMODES_FILE_PATH}
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
    Set Test Variable    ${NEW_TRANSPORT_TARGET_VALUE}    helsinki_internal_traffic

set test variables for new stop
    ${stop_label}    Street Name
    Set Test Variable    ${STOP_LABEL}    ${stop_label}
    ${today}    Date today
    Set Test Variable    ${DATE_TODAY}   ${today}

setup routes and lines
    seedDbWithFile    ${ROUTES_FILE_PATH}
    Go To    ${SUT_URL}

setup line edit
    setup routes and lines
    set test variables for edited line

set test variables for edited line
    Set Test Variable    ${LineNameValue}   Rautatientori - Malmi as.
    Set Test Variable    ${VALIDITY_START_DATE}   01012000
    Set Test Variable    ${VALIDITY_END_DATE}   01012064
    ${label}    Pyint   max_value=9999
    Set Test Variable    ${NEW_LINE_LABEL}    ${label}
    ${name}    Street Name
    Set Test Variable    ${NEW_LINE_NAME}   ${name}
    Set Test Variable    ${NEW_LINE_PRIMARY_VEHICLE_MODE}    train
    Set Test Variable    ${NEW_LINE_TYPE_VALUE}    regional_rail_service
    Set Test Variable    ${NEW_TRANSPORT_TARGET_VALUE}    espoo_regional_traffic

setup route edit
    setup routes and lines
    set test variables for edited route

set test variables for edited route
    Set Test Variable    ${LineNameValue}   Rautatientori - Nikkilä
    Set Test Variable    ${VALIDITY_START_DATE}   03032021
    Set Test Variable    ${VALIDITY_END_DATE}   01012023
    ${label}    Pyint   max_value=9999
    Set Test Variable    ${NEW_ROUTE_LABEL}    ${label}
    ${name}    Street Name
    Set Test Variable    ${NEW_ROUTE_NAME}   ${name}
    Set Test Variable    ${NEW_ROUTE_DIRECTION}   inbound