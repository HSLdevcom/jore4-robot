*** Settings ***
Resource            ./TestResources.robot
Force Tags          smoke
Suite Setup         setup browser
Suite Teardown      test teardown

*** Test Cases ***
Leaflet Can Be Zoomed In Once
    Get Url   equal    ${SUT_URL}
    Click    ${LEAFLET_ZOOM_IN}
    Get Attribute    ${LEAFLET_ZOOM_IN}    class    contains    disabled

Example Route Page Can Be Opened
    [Tags]    front-end
    Get Url    equal    ${SUT_URL}
    Click    ${EXAMPLE_ROUTE_LINK}
    Get Url    equal    ${EXAMPLE_ROUTE_URL}
