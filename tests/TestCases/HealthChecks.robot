*** Settings ***
Resource            ./TestResources.robot
Suite Setup         setup browser
Suite Teardown      reset browser

*** Test Cases ***
health check for test action
    [Tags]    action_health_check
    Get Url   equal    ${SUT_URL}
