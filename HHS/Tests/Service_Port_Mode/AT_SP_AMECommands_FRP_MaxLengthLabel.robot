*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
Suite Teardown  Run Keywords   ExitSP
...             AND   ClosePort
*** Variables ***
${current_directory}         ${data_source}\\Service_Port_Mode

*** test cases ***
AT_SP_AMECommands_FRP_MaxLengthLabel
    [Tags]      RS232_STD   RS232_WN   RS232_OPOS  USB_COM   USB_CPS
    EnterSP
    Display    UPCA_123456789012         0
    Send   $FRP031111012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678  	$>00,03
    Display    Datamatrix_128digit       0
    Send   $FRP031111012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678  	$>03,00
    ExitSP


