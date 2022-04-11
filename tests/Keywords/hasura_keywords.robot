*** Keywords ***
value in response is correct
    [Arguments]   ${response}   ${data_type}    ${key}    ${expected_value}
    ${value}     Get value from response by key     ${response}   ${data_type}    ${key}
    Should Be Equal    ${value}    ${expected_value}

line should be saved in db
    Wait Until Network Is Idle
    Sleep    1
    ${response}   Get line details from hasura    ${NEW_LINE_LABEL}
    line details should be correct    ${response}

stop should be saved in hasura
    Wait Until Network Is Idle
    ${response}     Get stop point details    ${STOP_LABEL}
    stop details should be correct    ${response}

stop details should be correct
    [Arguments]    ${response}
    starting date should be correct    ${response}    service_pattern_scheduled_stop_point
    coordinates should be correct      ${response}    service_pattern_scheduled_stop_point
    value in response is correct    ${response}   service_pattern_scheduled_stop_point    located_on_infrastructure_link_id    ${LINK_ID}
    value in response is correct    ${response}   service_pattern_scheduled_stop_point    direction                            ${DIRECTION}
    ${priority}  Convert To Integer   10
    value in response is correct    ${response}   service_pattern_scheduled_stop_point    priority    ${priority}

line details should be correct
    [Arguments]   ${response}
    starting date should be correct    ${response}    route_line
    value in response is correct    ${response}   route_line    name_i18n               ${NEW_LINE_NAME}
    value in response is correct    ${response}   route_line    primary_vehicle_mode    ${NEW_LINE_PRIMARY_VEHICLE_MODE}
    value in response is correct    ${response}   route_line    validity_end            ${None}
    ${priority}  Convert To Integer   10
    value in response is correct    ${response}   route_line    priority                ${priority}
    value in response is correct    ${response}   route_line    type_of_line            ${NEW_LINE_TYPE_VALUE}
    value in response is correct    ${response}   route_line    transport_target        ${NEW_TRANSPORT_TARGET_VALUE}

coordinates should be correct
    [Arguments]    ${response}    ${data_type}
    ${measured_location}     Get value from response by key     ${response}   ${data_type}    measured_location
    ${coordinates}    Get From Dictionary     ${measured_location}    coordinates
    ${latitude}     Convert To String    ${coordinates}[1]
    ${longitude}    Convert To String    ${coordinates}[0]
    Should Be Equal     ${STOP_LATITUDE}     ${latitude}
    Should Be Equal     ${STOP_LONGITUDE}    ${longitude}

remove line from hasura
    [Arguments]    ${label}
    Wait Until Network Is Idle
    ${response}     Delete line by label    ${label}

remove stop from hasura
    [Arguments]    ${label}
    Wait Until Network Is Idle
    ${response}     Delete stop by label    ${label}
