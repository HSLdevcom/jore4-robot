*** Variables ***
${RoutesAndLinesHeader}      //*[contains(@class, 'flex hover:bg-brand-darker')][2]
${OpenModalButton}           //Button[text()='Piirrä reitti']
${CreateNewLineButton}       //*[@id='create-line-button']

#new line form
${NewLineLabelInput}         //*[@id='label-input']
${NewLineFinnishNameInput}   //*[@id='finnish-name-input']
${NewLineVehicleInput}       //*[@id='primary-vehicle-mode-input']
${NewLineSaveButton}         //*[@id='save-button']

#map modal
${AddStopButton}             //Button[text()='Lisää pysäkki']
${MapGlMapBox}               //*[contains(@class, 'maplibregl-map mapboxgl-map')]
${EditStopButton}            //Button[text()='Muokkaa']
${StopInputNameField}        //input[contains(@name, 'finnishName')]
${SaveStopButton}            //Button[text()='Tallenna']
${StopLatitudeField}         //*[@name='latitude']
${StopLongitudeField}        //*[@name='longitude']

#priority and validity period
${StandardPriority}          //Button[text()='Perusversio']
${ValidityStartInput}        //*[@name='validityStart']
${IndefiniteCheckbox}        //*[@id='indefinite']
