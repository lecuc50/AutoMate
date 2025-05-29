*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Library     DataDriver      ../../Procedures/Quick_Test/DataSet/Leonardo_ConfigurationItems.xlsx  sheet_name=Sheet1
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
Suite Teardown  ExitSP
Test Template  GetAndSetConfigurationTags
*** Variables ***
${current_directory}         ${data_source}\\Quick_Test
*** test cases ***
Check configuration using ${ConfigurationItem}  ${InterfaceSupport}
    [Documentation]  Verify that the HH can set default value for all configuration tags
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS



*** Keywords ***
GetAndSetConfigurationTags
    [Arguments]  ${ConfigurationItem}  ${InterfaceSupport}
    EnterSP
    GetSetValueTag  ${ConfigurationItem}  ${InterfaceSupport}
    ExitSP
