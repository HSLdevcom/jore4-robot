*** Keywords ***
setup browser
    New Browser    ${BROWSER}   headless=true
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page  ${SUT_URL}

test teardown
    Delete All Cookies
    Close Browser
