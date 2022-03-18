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
    [Tags]    map
    [Setup]   set test variables for new stop
    given user goes to routes and lines map view
    when user adds a new bus stop
    then stop should be saved in hasura
    [Teardown]    remove stop from hasura    ${STOP_LABEL}

as a user i want to create a new route
    [Tags]    map
    [Setup]   set test variables for creating route
    given user goes to routes and lines map view
    when user draws a new route
    then route is saved in hasura
         route is shown on line page
    [Teardown]    Run Keywords    removeRoute    ${route_label}


*** Keywords ***
set test variables for creating route
    insertNewLineToHasura
    insertStopToHasura    coordinates for a stop
    insertStopToHasura    coordinates for a stop
    set name for route
    set label for route
    set line for route

user draws a new route
    click     add new route
    set details for route
    click map at    start coordinates
    click map at    end coordinate
    click map at    end coordinate
    save changes

route is saved in hasura
    graphql query for route details
    checkt that details are correct in query

route is shown on line page
    go to routes and lines page
    open page for line
    checkt that line contains new route details
