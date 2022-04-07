*** Keywords ***
user goes to routes and lines map view
    Click     ${RoutesAndLinesHeader}
    Click     ${OpenMapButton}

user creates a new line
    Click     ${RoutesAndLinesHeader}
    Click     ${CreateNewLineButton}
    input details for new line

input details for new line
    Fill Text     ${NewLineLabelInput}      ${NEW_LINE_LABEL}
    Fill Text     ${NewLineFinnishNameInput}    ${NEW_LINE_NAME}
    Click         ${NewLineTypeInput}
    Click         ${RegionalBusLineTypeOption}
    Click         ${StandardPriority}
    set indefinite validity period    ${DATE_TODAY}
    Click     ${NewLineSaveButton}

user opens map modal
    Click    ${RoutesAndLinesHeader}
    Click    ${OpenModalButton}

user adds a new bus stop
    [Documentation]   waits until network is idle, so that map is loaded properly
    Wait Until Network Is Idle
    Click    ${AddStopButton}    force=True
    Click    ${MapGlMapBox}   position_x= 960    position_y= 540    force=True
    edit new bus stop
    validate stop creation responses

validate stop creation responses
    ${point_to_closest_link}   Wait For Response    ${HASURA_API_URL}
    ${point_direction_on_link}   Wait For Response    ${HASURA_API_URL}
    ${insert_stop_point}   Wait For Response    ${HASURA_API_URL}

    ${point_to_link_json}   Dict to json    ${point_to_closest_link}[body]
    ${link_id}    Get value from response by key     ${point_to_link_json}   infrastructure_network_resolve_point_to_closest_link    infrastructure_link_id
    Set Test Variable     ${LINK_ID}     ${link_id}

    ${point_direction_json}   Dict to json    ${point_direction_on_link}[body]
    ${point_direction}    Get value from response by key     ${point_direction_json}   infrastructure_network_find_point_direction_on_link    value
    Set Test Variable    ${DIRECTION}     ${point_direction}

    ${insert_stop_point_json}   Dict to json    ${insert_stop_point}[body]
    ${located_on_link}    Get value from response by key     ${insert_stop_point_json}   insert_service_pattern_scheduled_stop_point_one    located_on_infrastructure_link_id
    ${point_direction}          Get value from response by key     ${insert_stop_point_json}   insert_service_pattern_scheduled_stop_point_one    direction
    Should Be Equal    ${point_direction}    ${DIRECTION}
    Should Be Equal    ${located_on_link}    ${LINK_ID}

edit new bus stop
    Click    ${EditStopButton}    force=True
    Fill Text   ${StopInputLabelField}    ${STOP_LABEL}
    ${latitude}     Get Text   ${StopLatitudeField}
    Set Test Variable    ${STOP_LATITUDE}    ${latitude}
    ${longitude}    Get Text   ${StopLongitudeField}
    Set Test Variable    ${STOP_LONGITUDE}    ${longitude}
    set indefinite validity period    ${DATE_TODAY}
    Click         ${StandardPriority}
    Click   ${SaveStopButton}    force=True

close map modal
    Click    ${CloseMapModal}
