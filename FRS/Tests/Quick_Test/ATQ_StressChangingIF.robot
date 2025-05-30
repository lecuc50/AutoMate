*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}


*** Variables ***
${current_directory}         ${data_source}\\Quick_Test
*** test cases ***
ATQ_StressChangingIF_RS232
    [Documentation]  Strees gun by changing interface and reading label. It should not hang or reset
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS
    # Description                                   Expected result
    Read  UPCA_123456789012	                        123456789012
    Read  $P,HA12,CSNRM03,P
    ChangeInterfaceTo  RS232-WN
    Read  UPCA_123456789012	                        123456789012
    Read  $P,HA13,CSNRM03,P
    ChangeInterfaceTo  RS232-OPOS
    Read  UPCA_123456789012	                        123456789012
    Read  $P,HA05,CSNRM03,P
    ChangeInterfaceTo  RS232-STD
