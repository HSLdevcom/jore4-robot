*** Keywords ***
user logs in with hslid
    Click    ${USER_LOGIN_BUTTON}
    input account details
    Click    ${LOGIN_PAGE_SIGN_IN_BUTTON}

user logs out
    Click    ${USER_PROFILE_BUTTON}
    Click    ${USER_DROPDOWN_LOGOUT}
    Click    ${HSLID_SIGN_OUT_BUTTON}
    Get Element    ${PLEASE_LOG_IN_TEXT}

user should be logged in
    user sees welcome message
    auth api returns correct user info

input account details
    Fill Secret    ${LOGIN_PAGE_EMAIL_FIELD}    ${EMAIL}
    Fill Secret    ${LOGIN_PAGE_PASSWORD_FIELD}   ${PASSWORD}

user sees welcome message
    Wait For Navigation    ${SUT_URL}
    ${text_on_page} =    Get Text    ${TEXT_FIELD}  *=  ${WELCOME_MESSAGE}

auth api returns correct user info
    &{res} =    Http    ${USER_INFO_URL}
    ${status_ok} =    Convert To Integer    200
    Should Be Equal    ${res.status}    ${status_ok}
    Should Be Equal    ${res.body.fullName}   ${TEST_USER_FULL_NAME}
