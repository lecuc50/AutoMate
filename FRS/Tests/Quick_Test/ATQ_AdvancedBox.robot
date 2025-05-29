*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
*** Variables ***
${current_directory}         ${data_source}\\Quick_Test


*** test cases ***
ATQ_AdvancedBox
    [Documentation]  This test verifies the rules for ISO compatible transmission for UCC composites and EAN128 Emulation
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                           Expected result
    Read  $P,CSNPM01,P
    Read  $P,CIPAB01,P
    Read  AdvancedBoxBC	           0105415098011978216PT9QUXNQHBS\\x1d240FA074824.09 OR/ 5415098011978\\r0105415098011978216PT9QUXNQHBS\\x1d240FA074824.09
    Read  AdvancedBoxField	       0105415098011978216PT9QUXNQHBS\\x1d240FA074824.09 OR/ 5415098011978\\r0105415098011978216PT9QUXNQHBS\\x1d240FA074824.09
