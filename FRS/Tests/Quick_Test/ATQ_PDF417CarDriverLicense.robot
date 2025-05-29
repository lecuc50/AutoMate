*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Library     DataDriver      ../../Procedures/Quick_Test/DataSet/ATQ_PDF417CarDriverLicense.xlsx  sheet_name=Sheet1
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
Test Template  ReadAndCheckPDF417CarDriverLicense

*** Variables ***
${current_directory}         ${data_source}\\Quick_Test

*** test cases ***
ATQ_PDF417CarDriverLicense ${Command}  ${ExpectedResult}
    [Documentation]  Test case checks the capability to decode the US_PDF417 Car Driver License
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS



*** Keywords ***
ReadAndCheckPDF417CarDriverLicense
    [Arguments]  ${Command}  ${ExpectedResult}
    Read  ${Command}  ${ExpectedResult}

