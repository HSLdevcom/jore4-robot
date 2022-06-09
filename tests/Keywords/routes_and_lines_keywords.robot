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
    Click         ${NewTransportTargetInput}
    Click         ${HelsinkiInternalTargetOption}
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
    user clicks on the map to create the stop
    edit new bus stop
    validate stop creation response

user clicks on the map to create the stop
    Click    ${MapGlMapBox}   position_x= 960    position_y= 540    force=True
    ${point_to_closest_link}   Wait For Response    async response => (await response.text()).indexOf('infrastructure_network_resolve_point_to_closest_link') >= 0
    ${point_direction_on_link}   Wait For Response    async response => (await response.text()).indexOf('infrastructure_network_find_point_direction_on_link') >= 0

    ${point_to_link_json}   Dict to json    ${point_to_closest_link}[body]
    ${link_id}    Get value from response by key     ${point_to_link_json}   infrastructure_network_resolve_point_to_closest_link    infrastructure_link_id
    Set Test Variable     ${LINK_ID}     ${link_id}

    ${point_direction_json}   Dict to json    ${point_direction_on_link}[body]
    ${point_direction}    Get value from response by key     ${point_direction_json}   infrastructure_network_find_point_direction_on_link    value
    Set Test Variable    ${DIRECTION}     ${point_direction}

validate stop creation response
    # wait for reponse of stop insert hasura call
    ${insert_stop_point}   Wait For Response    async response => (await response.text()).indexOf('insert_service_pattern_scheduled_stop_point_one') >= 0

    ${insert_stop_point_json}   Dict to json    ${insert_stop_point}[body]
    ${located_on_link}    Get value from response by key     ${insert_stop_point_json}   insert_service_pattern_scheduled_stop_point_one    located_on_infrastructure_link_id
    ${point_direction}          Get value from response by key     ${insert_stop_point_json}   insert_service_pattern_scheduled_stop_point_one    direction
    ${label}          Get value from response by key     ${insert_stop_point_json}   insert_service_pattern_scheduled_stop_point_one    label
    Should Be Equal    ${point_direction}    ${DIRECTION}
    Should Be Equal    ${located_on_link}    ${LINK_ID}
    Should Be Equal    ${label}    ${STOP_LABEL}

edit new bus stop
    Click    ${StopInputLabelField}    force=True
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

user goes to line details page
    Click    ${RoutesAndLinesHeader}
    Click   //*[text()='${LineNameValue}']

line page has correct content
    line details are visible
    stops for route are correct

line details are visible
    Get text    ${LineHeadingElement}    ==    ${LineHeadingValue}
    Get text    ${LineHeaderName}    ==    ${LineNameValue}
    Get text    ${LineHeaderValidityPeriod}    ==    ${LineHeaderValidityPeriodValue}
    Get text    ${DirectionBadge}    ==    ${DirectionBadgeValue}
    Get text    ${LineNameElement}    ==    ${LineNameValue}
    Get text    ${LinePrimaryVehicleModeElement}    ==    ${LinePrimaryVehicleModeValue}
    Get text    ${LineLabelElement}    ==    ${LineLabelValue}
    Get text    ${TypeOfLineElement}    ==    ${TypeOfLineValue}
    Get text    ${TransportTargetElement}    ==    ${TransportTargetValue}
    Get text    ${RouteNameElement}    ==    ${RouteNameValue}
    Get text    ${RouteValidityPeriodElement}    ==    ${RouteValidityPeriodValue}

stops for route are correct
    Click       ${ShowRouteStopsButton}
    Get text    ${RouteStopLabelElement}    ==    ${RouteStopLabelValue}
    Get text    ${RouteStopValidityPeriodElement}    ==    ${RouteStopValidityPeriodValue}
    Get text    ${StopNotOnRouteValidityLabel}    ==    ${StopNotOnRouteValidityLabelValue}
    Get text    ${StopNotOnRouteValidityPeriodElement}    ==    ${StopNotOnRouteValidityPeriodValue}
