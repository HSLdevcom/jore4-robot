*** Settings ***
Resource            ./TestResources.robot
Force Tags          smoke
Suite Setup         setup browser
Suite Teardown      test teardown

*** Test Cases ***
health check for test action
    [Tags]    action_health_check
    Get Url   equal    ${SUT_URL}

as a user i want to login with hslid
    [Tags]    login
    given user logs in with hslid
    then user should be logged in
