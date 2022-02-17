*** Keywords ***
user logs in with hslid
    Click    ${UserLoginButton}
    input account details
    Click    ${LoginPageSignInButton}

user logs out
    Click    ${USER_PROFILE_BUTTON}
    Click    ${USER_DROPDOWN_LOGOUT}
    Click    ${HSLID_SIGN_OUT_BUTTON}
    Get Element    ${PLEASE_LOG_IN_TEXT}

user should be logged in
    user sees welcome message
    auth api returns correct user info

input account details
    Fill Secret    ${LoginPageEmailField}    ${EMAIL}
    Fill Secret    ${LoginPagePasswordField}   ${PASSWORD}

user sees welcome message
    Wait For Navigation    ${SUT_URL}
    ${text_on_page} =    Get Text    ${TextField}  *=  ${WelcomeMessage}

auth api returns correct user info
    &{res} =    Http    ${USER_INFO_URL}
    ${status_ok} =    Convert To Integer    200
    Should Be Equal    ${res.status}    ${status_ok}
    Should Be Equal    ${res.body.fullName}   ${TEST_USER_FULL_NAME}
