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

as a user i want to see line details
    [Tags]    line    line page
    [Setup]   setup routes and lines
    given user goes to line details page
    then line page has correct content

