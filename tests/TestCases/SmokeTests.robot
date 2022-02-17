*** Settings ***
Resource            ./TestResources.robot
Force Tags          smoke
Suite Setup         log in to jore4
Suite Teardown      suite teardown

*** Test Cases ***
as a user i want to create a new line
    [Tags]    line
    [Setup]   set test variables for new line
    given user creates a new line
    then line should be saved in db
    [Teardown]    Go To    ${SUT_URL}

as a user i want to add a new stop
    [Tags]    map
    [Setup]   set test variables for new stop
    given user goes to routes and lines map view
    when user adds a new bus stop
    then stop should be saved in hasura
    [Teardown]    Go To    ${SUT_URL}
