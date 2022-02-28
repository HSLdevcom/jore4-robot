*** Keywords ***
log in to jore4
    setup browser
    user logs in with hslid

setup browser
    New Browser    ${BROWSER}   headless=true
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page  ${SUT_URL}

suite teardown
    user logs out
    Delete All Cookies
    Close Browser

set test variables for new line
    ${today}    Date today
    Set Test Variable    ${DATE_TODAY}   ${today}
    ${label}    Pyint   max_value=9999
    Set Test Variable    ${NEW_LINE_LABEL}    ${label}
    ${name}    Street Name
    Set Test Variable    ${NEW_LINE_NAME}   ${name}
    Set Test Variable    ${NEW_LINE_PRIMARY_VEHICLE_MODE}    bus
