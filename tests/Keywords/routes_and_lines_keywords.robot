*** Keywords ***
user creates a new line
    Click     ${RoutesAndLinesHeader}
    Click     ${CreateNewLineButton}
    input details for new line

input details for new line
    Fill Text     ${NewLineLabelInput}      ${NEW_LINE_LABEL}
    Fill Text     ${NewLineFinnishNameInput}    ${NEW_LINE_NAME}
    Click         ${StandardPriority}
    ${date_mmddyyyy}    Date as mmddyyyy    ${DATE_TODAY}
    Type Text     ${ValidityStartInput}     ${date_mmddyyyy}
    Click     ${IndefiniteCheckbox}
    Click     ${NewLineSaveButton}

line should be saved in db
    Wait Until Network Is Idle
    Sleep    1
    ${response}   Get line details from hasura    ${NEW_LINE_LABEL}
    line details should be correct    ${response}


line details should be correct
    [Arguments]   ${response}
    starting date should be correct    ${response}
    value in response is correct    ${response}   route_line    name_i18n               ${NEW_LINE_NAME}
    value in response is correct    ${response}   route_line    primary_vehicle_mode    ${NEW_LINE_PRIMARY_VEHICLE_MODE}
    value in response is correct    ${response}   route_line    validity_end            ${None}
    ${priority}  Convert To Integer   10
    value in response is correct    ${response}   route_line    priority                ${priority}

value in response is correct
    [Arguments]   ${response}   ${data_type}    ${key}    ${expected_value}
    ${value}     Get value from response by key     ${response}   ${data_type}    ${key}
    Should Be Equal    ${value}    ${expected_value}

starting date should be correct
    [Arguments]   ${response}
    ${start_date}     Get value from response by key     ${response}    route_line    validity_start
    ${start_date_trimmed}   Split String    ${start_date}    T
    ${converted_date}     Convert date format to utc ymd    ${DATE_TODAY}
    Should Be Equal    ${start_date_trimmed}[0]    ${converted_date}
