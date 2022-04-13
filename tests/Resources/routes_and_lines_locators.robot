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
${NewLineSaveButton}         //*[@id='save-button']

#map modal
${DrawRouteButton}            //Button[text()='Vedä reitti']
${AddStopButton}             //Button[text()='Lisää pysäkki']
${MapGlMapBox}               //*[contains(@class, 'maplibregl-map mapboxgl-map')]

#stop popup
${EditStopButton}            //Button[text()='Muokkaa']

#edit stop modal
${StopInputLabelField}        //input[contains(@name, 'label')]
${SaveButton}            //Button[text()='Tallenna']
${StopLatitudeField}         //*[@name='latitude']
${StopLongitudeField}        //*[@name='longitude']
${SaveRouteButton}         //Button[@class="px-4 py-2 font-bold rounded-full text-white bg-brand border border-brand hover:bg-opacity-50 active:bg-opacity-50  undefined"]

#draw route details form
${RouteNameField}            //*[@id='description_i18n']
${RouteLabelField}           //*[@id='label']
${LineDropdown}              //*[contains(@id, 'headlessui-listbox-button')]
${Line65DropdownElement}     //span[contains(text(),'65 (Rautatientori - Veräjälaakso)')]

#priority and validity period
${StandardPriority}          //Button[text()='Perusversio']
${ValidityStartInput}        //*[@name='validityStart']
${IndefiniteCheckbox}        //*[@id='indefinite']
${CloseMapModal}             //Button[text()='Sulje']
