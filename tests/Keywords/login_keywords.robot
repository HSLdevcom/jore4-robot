*** Keywords ***
user logs in with hslid
    Click    ${UserLoginButton}
    input account details
    Click    ${LoginPageSignInButton}

user logs out
    Click    ${UserProfileButton}
    Click    ${UserDropdownLogout}
    Click    ${HslidSignOutButton}
    Get Element    ${PleaseLogInText}

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
