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
