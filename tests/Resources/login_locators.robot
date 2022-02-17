*** Variables ***
${UserLoginButton}    //*[contains(@href, '/login')]

${LoginPageEmailField}     //*[contains(@id, 'gwt-uid-4')]
${LoginPagePasswordField}    //*[contains(@id, 'gwt-uid-8')]
${LoginPageSignInButton}    //*[contains(@class, 'v-button-login-button')]

${TextField}           //h1
${WelcomeMessage}      Welcome!

${UserProfileButton}      //*[text()='${TEST_USER_FIRST_NAME}']
${UserDropdownLogout}     //*[text()='Kirjaudu ulos']
${HslidSignOutButton}    //*[text()='Sign out']

${PleaseLogInText}       //*[text()='Please log in.']
