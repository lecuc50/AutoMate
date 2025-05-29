*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
Suite Teardown  Run Keywords   ExitSP
...             AND   ClosePort
*** Variables ***
${current_directory}         ${data_source}\\Service_Port_Mode

*** test cases ***
AT_SP_AllConfigItems
    [Tags]      RS232_STD   RS232_WN   RS232_OPOS  USB_COM   USB_CPS
    EnterSP
    Send   $AR	  $>
    Send   $Er	  $>
    Send   $CIDCO01	  $>
    ${data}=   Send   $a
    Run Keyword And Continue On Failure    Should Contain    ${data}    IDCO01
    ExitSP	 
    CheckReset	  0