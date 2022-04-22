*** Settings ***
Resource            ./TestResources.robot
Force Tags          smoke
Suite Setup         suite setup for map tests
Suite Teardown      suite teardown
Test Setup          Go To    ${SUT_URL}

*** Test Cases ***
as a user i want to create a new line
    [Tags]    line
    [Setup]   set test variables for new line
    given user creates a new line
    then line should be saved in db
    [Teardown]    remove line from hasura    ${NEW_LINE_LABEL}

as a user i want to add a new stop
    [Tags]    map    stop
    [Setup]   set test variables for new stop
    given user goes to routes and lines map view
    when user adds a new bus stop
    then stop should be saved in hasura
    [Teardown]    remove stop from hasura    ${STOP_LABEL}

as a user i want to create a new route
    [Tags]    map    route
    [Setup]   set test variables for creating route
    given user goes to routes and lines map view
    when user draws a new route
    #then route is saved in hasura
    #[Teardown]    removeRoute    ${route_label}

*** Keywords ***
user draws a new route
    Click     ${DrawRouteButton}
    set details for route
    Click    ${MapGlMapBox}   position_x= 805    position_y= 650    force=True
    Click    ${MapGlMapBox}   position_x= 880    position_y= 600    force=True
    Click    ${MapGlMapBox}   position_x= 880    position_y= 600    force=True
    ${response1}   Wait For Response    response => response.body() === 'body'    timeout=20s
    Log    ${response1}
    ${response2}   Wait For Response    timeout=20s
    Log    ${response2}
    ${response3}   Wait For Response    timeout=20s
    Log    ${response3}
    save changes

save changes
    Wait Until Network Is Idle
    Wait For Elements State    ${SaveRouteButton}   enabled    timeout=20 s
    Click    ${SaveRouteButton}   force=True
    ${response1}   Wait For Response
    Log    ${response1}
    Take Screenshot

route is saved in hasura
    graphql query for route details
    checkt that details are correct in query
