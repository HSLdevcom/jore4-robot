*** Variables ***
${ExampleRouteLink}   //*[contains(@href, 'example-route')]
${UserLoginButton}    //*[contains(@href, '/login')]
${UserProfileDropdownButton}   headlessui-menu-item-11

${LoginPageEmailField}     //*[contains(@id, 'gwt-uid-4')]
${LoginPagePasswordField}    //*[contains(@id, 'gwt-uid-8')]
${LoginPageSignInButton}    //*[contains(@class, 'v-button-login-button')]

${TextField}           //h1
${WelcomeMessage}      Welcome!



${USER_PROFILE_DROPDOWN_BUTTON}   headlessui-menu-item-11
${USER_PROFILE_BUTTON}      //*[text()='${TEST_USER_FIRST_NAME}']
${USER_DROPDOWN_LOGOUT}     //*[text()='Kirjaudu ulos']
${HSLID_SIGN_OUT_BUTTON}    //*[text()='Sign out']

${LOGIN_PAGE_EMAIL_FIELD}     //*[contains(@id, 'gwt-uid-4')]
${LOGIN_PAGE_PASSWORD_FIELD}    //*[contains(@id, 'gwt-uid-8')]
${LOGIN_PAGE_SIGN_IN_BUTTON}    //*[contains(@class, 'v-button-login-button')]

${PLEASE_LOG_IN_TEXT}       //*[text()='Please log in.']
