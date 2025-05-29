*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
Suite Teardown  Run Keywords   ExitSP
...             AND   ClosePort
*** Variables ***
${current_directory}         ${data_source}\\Service_Port_Mode

*** test cases ***
AT_SP_EnterExitByComdWithParityEven
    [Documentation]   Verify that sending $s<CR> will not exit Service Port Mode in RS232 if parity setting to Even $s only works on parity None.
    [Tags]      RS232_STD  RS232_WN  RS232_OPOS
    Send    $S,CR2PA01,Ar       $>,>,>
    ChangeParity    Even
    Read   UPCA_123456789012	CONTAINS: 123456789012
    Send   $S                  $>
    Send   $s                  ${EMPTY}
    ChangeParity    None
    ChangeBaud    115200
    Send   $s                  $>
    [Teardown]   Read    $P,AE,Interface,CSNRM03,P

