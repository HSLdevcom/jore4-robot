*** Variables ***
${RoutesAndLinesHeader}      //*[contains(@class, 'flex hover:bg-brand-darker')][2]
${OpenMapButton}             //Button[text()='Avaa kartta']
${CreateNewLineButton}       //*[@id='create-line-button']
${RouteLinePlusButton}       (//*[@stroke="currentColor"])[1]

#new line form
${NewLineLabelInput}              //*[@id='label-input']
${NewLineFinnishNameInput}        //*[@id='finnish-name-input']
${NewLineVehicleModeInput}        //*[@data-testid='primary-vehicle-mode-input']
${TrainVehicleTypeOption}         //li[contains(.,'Juna')]
${NewLineTypeInput}               //*[@data-testid='type-of-line-input']
${RegionalBusLineTypeOption}      //li[contains(.,'U-linja')]
${RegionalRailLineTypeOption}     //li[contains(.,'Seudullinen juna')]
${NewTransportTargetInput}        //*[@data-testid='transport-target-input']
${NewLineSaveButton}              //*[@id='save-button']
${HelsinkiInternalTargetOption}   //li[contains(.,'Helsingin sisäinen liikenne')]
${EspooRegionalTargetOption}      //li[contains(.,'Espoon seudullinen liikenne')]

#map modal
${AddStopButton}             //Button[text()='Lisää pysäkki']
${MapGlMapBox}               //*[contains(@class, 'maplibregl-map mapboxgl-map')]

#stop popup
${EditStopButton}            //Button[text()='Muokkaa']

#edit stop modal
${StopInputLabelField}        //input[contains(@name, 'label')]
${SaveStopButton}            //Button[text()='Tallenna']
${StopLatitudeField}         //*[@name='latitude']
${StopLongitudeField}        //*[@name='longitude']


#priority and validity period
${StandardPriority}          //Button[text()='Perusversio']
${ValidityStartInput}        //*[@name='validityStart']
${ValidityEndInput}          //*[@name='validityEnd']
${IndefiniteCheckbox}        //*[@id='indefinite']
${CloseMapModal}             //Button[text()='Sulje']


#line page
${LineHeadingElement}                    //*[@data-testid='line-page-heading']
${LineHeaderName}                        //*[@data-testid='line-header-name']
${LineHeaderValidityPeriod}              //*[@data-testid='line-header-validity-period']
${LineNameElement}                       //*[@data-testid='line-details-name']
${LinePrimaryVehicleModeElement}         //*[@data-testid='line-details-primary-vehicle-mode']
${LineLabelElement}                      //*[@data-testid='line-details-label']
${TypeOfLineElement}                     //*[@data-testid='line-details-type-of-line']
${TransportTargetElement}                //*[@data-testid='line-details-transport-target']
${DirectionBadge}                        //*[@data-testid='direction-value']
${RouteLabelElement}                     //*[@data-testid='route-row-label']
${RouteNameElement}                      //*[@data-testid='route-row-name']
${RouteValidityPeriodElement}            //*[@data-testid='route-row-validity-period']
${ShowRouteStopsButton}                  //*[@data-testid='RouteStopsHeaderRow::toggleAccordion']
${RouteStopLabelElement}                 (//*[@data-testid='stop-row-label'])[1]
${RouteStopValidityPeriodElement}        (//*[@data-testid='stop-row-validity-period'])[1]
${StopNotOnRouteValidityLabel}           (//*[@data-testid='stop-row-label'])[2]
${StopNotOnRouteValidityPeriodElement}   (//*[@data-testid='stop-row-validity-period'])[2]
${EditLineButton}                        //*[@data-testid='edit-line-button']
