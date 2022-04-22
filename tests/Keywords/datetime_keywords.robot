*** Keywords ***
starting date should be correct
    [Arguments]   ${response}    ${data_type}
    ${start_date}     Get value from response by key     ${response}    ${data_type}    validity_start
    ${start_date_trimmed}   Split String    ${start_date}    T
    ${converted_date}     Convert date format to utc ymd    ${DATE_TODAY}
    Should Be Equal    ${start_date_trimmed}[0]    ${converted_date}

set indefinite validity period
    [Arguments]    ${start_date}
    ${date_mmddyyyy}    Date as mmddyyyy    ${start_date}
    Type Text     ${ValidityStartInput}     ${date_mmddyyyy}
    Click     ${IndefiniteCheckbox}

set validity period with ending date
    [Arguments]    ${start_date}    ${end_date}
    ${start_date_mmddyyyy}    Date as mmddyyyy    ${start_date}
    Type Text     ${ValidityStartInput}     ${start_date_mmddyyyy}
    ${end_date_mmddyyyy}    Date as mmddyyyy    ${end_date}
    Type Text     ${ValidityEndInput}     ${end_date_mmddyyyy}
