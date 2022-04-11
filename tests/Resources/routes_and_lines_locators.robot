*** Variables ***
${RoutesAndLinesHeader}      //*[contains(@class, 'flex hover:bg-brand-darker')][2]
${OpenMapButton}             //Button[text()='Avaa kartta']
${CreateNewLineButton}       //*[@id='create-line-button']
${RouteLinePlusButton}       (//*[@stroke="currentColor"])[1]

#new line form
${NewLineLabelInput}         //*[@id='label-input']
${NewLineFinnishNameInput}   //*[@id='finnish-name-input']
${NewLineVehicleInput}       //*[@id='primary-vehicle-mode-input']
${NewLineTypeInput}          //*[@data-testid='type-of-line-input']
${RegionalBusLineTypeOption}    //li[contains(.,'U-linja')]
${NewTransportTargetInput}   //*[@data-testid='transport-target-input']
${NewLineSaveButton}         //*[@id='save-button']
${HelsinkiInternalTargetOption}  //li[contains(.,'Helsingin sisäinen liikenne')]

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
${IndefiniteCheckbox}        //*[@id='indefinite']
${CloseMapModal}             //Button[text()='Sulje']
