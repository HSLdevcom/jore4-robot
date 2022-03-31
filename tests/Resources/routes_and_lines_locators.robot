*** Variables ***
${RoutesAndLinesHeader}      //*[contains(@class, 'flex hover:bg-brand-darker')][2]
${OpenMapButton}             //Button[text()='Avaa kartta']
${CreateNewLineButton}       //*[@id='create-line-button']
${RouteLinePlusButton}       (//*[@stroke="currentColor"])[1]

#new line form
${NewLineLabelInput}         //*[@id='label-input']
${NewLineFinnishNameInput}   //*[@id='finnish-name-input']
${NewLineVehicleInput}       //*[@id='primary-vehicle-mode-input']
${NewLineSaveButton}         //*[@id='save-button']

#map modal
${AddStopButton}             //Button[text()='Lisää pysäkki']
${MapGlMapBox}               //*[contains(@class, 'maplibregl-map mapboxgl-map')]
${EditStopButton}            //Button[text()='Muokkaa']
${StopInputLabelField}        //input[contains(@name, 'label')]
${SaveStopButton}            //Button[text()='Tallenna']
${StopLatitudeField}         //*[@name='latitude']
${StopLongitudeField}        //*[@name='longitude']


#priority and validity period
${StandardPriority}          //Button[text()='Perusversio']
${ValidityStartInput}        //*[@name='validityStart']
${IndefiniteCheckbox}        //*[@id='indefinite']
${CloseMapModal}             //Button[text()='Sulje']
