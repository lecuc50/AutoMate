*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
Suite Teardown  Run Keywords   ExitSP
...             AND   ClosePort
*** Variables ***
${current_directory}         ${data_source}\\Service_Port_Mode

*** test cases ***
AT_SP_Baud
    [Tags]      RS232_STD   RS232_WN   RS232_OPOS
    #Description        Expected Result
    EnterSP
    Send   $B00	            $>
    Send   $cABEN           ${EMPTY}
    ChangeBaud   9600
    Send   $cABEN	        $>01
    Send   $B01	            $>
    Send   $cABEN           ${EMPTY}
    ChangeBaud   19200
    Send   $cABEN	        $>01
    Send   $B02	            $>
    Send   $cABEN           ${EMPTY}
    ChangeBaud   38400
    Send   $cABEN	        $>01
    Send   $B03	            $>
    Send   $cABEN           ${EMPTY}
    ChangeBaud   57600
    Send   $cABEN	        $>01
    Send   $B04	            $>
    Send   $cABEN           ${EMPTY}
    ChangeBaud   115200
    Send   $cABEN	        $>01
    ExitSP
    [Teardown]   Read    $P,AE,Interface,CSNRM03,P