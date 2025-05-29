*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
Suite Teardown  Run Keywords   ExitSP
...             AND   ClosePort
*** Variables ***
${current_directory}         ${data_source}\\Service_Port_Mode

*** test cases ***
AT_SP_CancelChar
    [Documentation]  -	This test case is used to verify that the ‘~’ character can be used to abort a ‘$’ message that hasn’t been completely sent yet.
    ...              - When a ‘~’ character is received by the scanner, the scanner will discard all of bytes that it has accumulated before the terminating <CR>.
    ...              - Once a message <CR> is received by the scanner, the message cannot be aborted.

    [Tags]      RS232_STD      RS232_WN        RS232_OPOS       USB_COM      USB_CPS
    # Description	             Expected result
    EnterSP
    Send    $CABEN01	            $>
    Send    $cABEN	                $>01
    Send    $cC9EN	                $>00
    Send    $CABEN00~               ${EMPTY}
    Send    $cABEN	                $>01
    Send    $CABEN00,CC9EN01~       ${EMPTY}
    Send    $cABEN	                $>01
    Send    $cC9EN	                $>00
    Send    $CABEN00	            $>
    Send    ~                       ${EMPTY}
    Send    $cABEN	                $>00
    Send    $Ar	                    $>
