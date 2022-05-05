*** Keywords ***
starting date should be correct
    [Arguments]   ${response}    ${data_type}
    ${start_date}     Get value from response by key     ${response}    ${data_type}    validity_start
    ${start_date_trimmed}   Split String    ${start_date}    T
    ${converted_date}     Convert date format to utc ymd    ${DATE_TODAY}
    Should Be Equal    ${start_date_trimmed}[0]    ${converted_date}

validity period should be correct
    [Arguments]   ${response}    ${data_type}
    ${start_date}     Get value from response by key     ${response}    ${data_type}    validity_start
    ${end_date}     Get value from response by key     ${response}    ${data_type}    validity_end
    ${start_date_trimmed}   Split String    ${start_date}    T
    ${end_date_trimmed}   Split String    ${end_date}    T
    ${converted_start_date}     convertStartDateString    ${VALIDITY_START_DATE}
    ${converted_end_date}     convertEndDateString    ${VALIDITY_END_DATE}
    Should Be Equal    ${start_date_trimmed}[0]    ${converted_start_date}
    Should Be Equal    ${end_date_trimmed}[0]    ${converted_end_date}

set indefinite validity period
    [Arguments]    ${start_date}
    ${date_mmddyyyy}    Date as mmddyyyy    ${start_date}
    Type Text     ${ValidityStartInput}     ${date_mmddyyyy}
    Check Checkbox     ${IndefiniteCheckbox}

set validity period
    [Arguments]    ${start_date}   ${end_date}
    Uncheck Checkbox     ${IndefiniteCheckbox}
    Type Text     ${ValidityStartInput}     ${start_date}
    Type Text     ${ValidityEndInput}     ${end_date}
