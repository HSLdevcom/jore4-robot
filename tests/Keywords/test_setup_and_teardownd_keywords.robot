*** Keywords ***
suite setup for map tests
    addInfraLinksToDb
    addVehicleSubmodesToDb
    log in to jore4

log in to jore4
    setup browser
    user logs in with hslid

setup browser
    New Browser    ${BROWSER}   headless=true
    New Context    viewport={'width': ${SCREEN_WITDH}, 'height': ${SCREEN_HEIGHT}}
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
