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
    #     route is shown on line page
    #[Teardown]    removeRoute    ${route_label}

init db
    [Tags]    insert_data
    addInfraLinksToDb
    addVehicleSubmodesToDb
    addRoutesToDb

*** Keywords ***
user draws a new route
    Sleep   30
    Click     ${DrawRouteButton}
    Take Screenshot
    set details for route
    Click    ${MapGlMapBox}   position_x= 805    position_y= 655    force=True
    Click    ${MapGlMapBox}   position_x= 900    position_y= 585    force=True
    Click    ${MapGlMapBox}   position_x= 900    position_y= 585    force=True
    ${response1}   Wait For Response
    Log    ${response1}
    ${response2}   Wait For Response
    Log    ${response2}
    ${response3}   Wait For Response
    Log    ${response3}
    save changes

save changes
    Wait Until Network Is Idle
    Click    ${SaveRouteButton}   force=True
    Sleep   1
    Take Screenshot

route is saved in hasura
    graphql query for route details
    checkt that details are correct in query

route is shown on line page
    go to routes and lines page
    open page for line
    check that line contains new route details
