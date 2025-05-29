*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
Suite Teardown  Run Keywords   ExitSP
...             AND   ClosePort
*** Variables ***
${current_directory}         ${data_source}\\Service_Port_Mode


*** test cases ***
AT_SP_EnterExitPuttingonSmartStand
    [Documentation]   This test case validates scanner doesn’t auto reset when enter SP while putting HH on smart stand.
    [Tags]      RS232_STD  RS232_WN  RS232_OPOS  USB_COM  USB_CPS
    Send  $S,CSMSD03,Ar	        $>,>,>
    Send  $S,AR,Er,s	        $>,>,>,>
    Display   UPCA_123456789012
    FOR    ${counter}    IN RANGE    1    100    1
        EnterSP
        ExitSP
    END
    CheckReset	0
    [Teardown]   ClearEink
