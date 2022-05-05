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


#routes and lines page
${LineTableRow}              //*[text()='Veräjälaakso - Rautatientori']
${LineTableRow2}             //*[text()='Rautatientori - Malmi as.']

#line page
${LineInfoElement}                       //*[contains(@class, 'container mx-auto py-12 undefined')]
${DirectionBadge}                        //*[contains(@class, 'border-l-8 py-4 pl-16 pr-4 text-3xl font-bold')]
${LineNameElement}                       (//*[contains(@class, 'text-3xl font-semibold')])[2]
${LinePrimaryVehicleModeElement}         (//*[contains(@class, 'text-3xl font-semibold')])[3]
${LineLabelElement}                      (//*[contains(@class, 'text-3xl font-semibold')])[4]
${TypeOfLineElement}                     (//*[contains(@class, 'text-3xl font-semibold')])[5]
${TransportTargetElement}                (//*[contains(@class, 'text-3xl font-semibold')])[6]
${RouteNameElement}                      //*[contains(@class, 'flex items-center py-4 text-3xl')]
${RouteValidityPeriodElement}            //*[contains(@class, 'pr-16 text-right')]
${ShowRouteStopsButton}                  //*[@data-testid='RouteStopsHeaderRow::toggleAccordion']
${RouteStopLabelElement}                 ((//tr[contains(@class, 'border border-l-8')])[1]//*)[1]
${RouteStopValidityPeriodElement}        ((//tr[contains(@class, 'border border-l-8')])[1]//*)[3]
${StopNotOnRouteValidityLabel}           ((//tr[contains(@class, 'border border-l-8 bg-background text-dark-grey')])[1]//*)[1]
${StopNotOnRouteValidityPeriodElement}   ((//tr[contains(@class, 'border border-l-8 bg-background text-dark-grey')])[1]//*)[3]
${EditLineButton}                        (//*[contains(@class, 'ml-5 rounded-full border border-grey bg-white')])[1]