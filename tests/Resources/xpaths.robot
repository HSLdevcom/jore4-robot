*** Variables ***
${LEAFLET_MARKER}     //*[contains(@class, 'leaflet-marker-icon')]
${LEAFLET_ZOOM_IN}    //*[contains(@class, 'leaflet-control-zoom-in')]
${LEAFLET_ZOOM_OUT}    //*[contains(@class, 'leaflet-control-zoom-out)]

${EXAMPLE_ROUTE_LINK}   //*[contains(@href, 'example-route')]
${USER_LOGIN_BUTTON}    //*[contains(@href, '/login')]
${USER_PROFILE_DROPDOWN_BUTTON}   headlessui-menu-item-11
${USER_PROFILE_BUTTON}      //*[text()='${TEST_USER_FIRST_NAME}']
${USER_DROPDOWN_LOGOUT}     //*[text()='Kirjaudu ulos']
${HSLID_SIGN_OUT_BUTTON}    //*[text()='Sign out']

${LOGIN_PAGE_EMAIL_FIELD}     //*[contains(@id, 'gwt-uid-4')]
${LOGIN_PAGE_PASSWORD_FIELD}    //*[contains(@id, 'gwt-uid-8')]
${LOGIN_PAGE_SIGN_IN_BUTTON}    //*[contains(@class, 'v-button-login-button')]

${PLEASE_LOG_IN_TEXT}       //*[text()='Please log in.']
