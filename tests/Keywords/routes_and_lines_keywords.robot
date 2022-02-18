*** Keywords ***
user creates a new line
    Click     ${RoutesAndLinesHeader}
    Click     ${CreateNewLineButton}
    input new line details

input new line details
    Fill Text     ${NewLineLabelInput}      ${NEW_LINE_LABEL}
    Fill Text     ${NewLineFinnishNameInput}    ${NEW_LINE_NAME}
    Click     ${NewLineSaveButton}

line should be saved in db
    Sleep   1
    ${response}   Get line details from hasura    ${NEW_LINE_LABEL}
    line details should be correct    ${response}


line details should be correct
    [Arguments]   ${response}
    Should Contain    ${response}    "name_i18n": "${NEW_LINE_NAME}"
    Should Contain    ${response}    "primary_vehicle_mode": "${NEW_LINE_PRIMARY_VEHICLE_MODE}"
