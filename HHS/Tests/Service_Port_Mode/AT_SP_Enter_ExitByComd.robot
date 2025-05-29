*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
Suite Teardown  Run Keywords   ExitSP
...             AND   ClosePort
*** Variables ***
${current_directory}         ${data_source}\\Service_Port_Mode

*** test cases ***
AT_SP_Enter_ExitByComd
    [Documentation]   Verify that sending $S<CR> or $s<CR> will Enter/exit Service Port Mode in RS232/USB-COM and while
    ...  in service port mode, scanner can reading and transmitting labels.
    [Tags]      RS232_STD  USB_COM   USB_CPS
    EnterSP
    ExitSP
    Read    Code128_ABCabc          ABCabc
    Read    RevA                    AnyValue
    EnterSP
    Send    $CABEN00                $>
    Send    $cABEN                  $>00
    Read    RevA                    AnyValue
    Send    $Ar                     $>
    Read    UPCA_123456789012       NoRead
    Read    Code128_ABCabc          ABCabc
    Read    RevA                    AnyValue


AT_SP_Enter_ExitByComd
    [Documentation]   Verify that sending $S<CR> or $s<CR> will Enter/exit Service Port Mode in RS232/USB-COM and while
    ...  in service port mode, scanner can reading and transmitting labels.
    [Tags]      RS232_WN
    EnterSP
    ExitSP
    Read    Code128_ABCabc          KABCabc
    Read    RevA                    AnyValue
    EnterSP
    Send    $CABEN00                $>
    Send    $cABEN                  $>00
    Read    RevA                    AnyValue
    Send    $Ar
    Read    UPCA_123456789012       NoRead
    Read    Code128_ABCabc          KABCabc
    Read    RevA                    AnyValue

AT_SP_Enter_ExitByComd
    [Documentation]   Verify that sending $S<CR> or $s<CR> will Enter/exit Service Port Mode in RS232/USB-COM and while
    ...  in service port mode, scanner can reading and transmitting labels.
    [Tags]      RS232_OPOS
    EnterSP
    ExitSP
    Read    Code128_ABCabc          TABCabc
    Read    RevA                    AnyValue
    EnterSP
    Send    $CABEN00                $>
    Send    $cABEN                  $>00
    Read    RevA                    AnyValue
    Send    $Ar
    Read    UPCA_123456789012       NoRead
    Read    Code128_ABCabc          TABCabc
    Read    RevA                    AnyValue

