*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
Suite Teardown  Run Keywords   ExitSP
...             AND   ClosePort
*** Variables ***
${current_directory}         ${data_source}\\Service_Port_Mode


*** test cases ***
AT_SP_CondAddOnValue
    [Tags]      RS232_STD      USB_COM      USB_CPS
    #Description                                                    Expected Result
    EnterSP
    Send   $CABEN01,CADO501,C8BEN01,CADC41232                            $>,>,>,>
    Send   $As	                                                         $>
    Send   $r02	                                                         $>
    Send   $r02	                                                             $>
    ExitSP
    Send  R
    Read  UPCA_AddOn5_12345678901212345	                                12345678901212345
    Read  UPCA_AddOn5_12945678901412345	                                12945678901412345
    Read  EAN8_12345670	                                                12345670
    Read  UPCA_123456789012                                             NoRead

AT_SP_CondAddOnValue
    [Tags]      RS232_WN
    #Description                                                    Expected Result
    EnterSP
    Send   $CABEN01,CADO501,C8BEN01,CADC41232                            $>,>,>,>
    Send   $As	                                                         $>
    Send   $r02	                                                         $>
    Send   $r02	                                                             $>
    ExitSP
    Send  R
    Read  UPCA_AddOn5_12345678901212345	                                A012345678901212345
    Read  UPCA_AddOn5_12945678901412345	                                A012945678901412345
    Read  EAN8_12345670	                                                B12345670
    Read  UPCA_123456789012                                             NoRead

AT_SP_CondAddOnValue
    [Tags]      RS232_OPOS
    #Description                                                    Expected Result
    EnterSP
    Send   $CABEN01,CADO501,C8BEN01,CADC41232                            $>,>,>,>
    Send   $As	                                                         $>
    Send   $r02	                                                         $>
    Send   $r02	                                                             $>
    ExitSP
    Send  R
    Read  UPCA_AddOn5_12345678901212345	                                G12345678901212345
    Read  UPCA_AddOn5_12945678901412345	                                G12945678901412345
    Read  EAN8_12345670	                                                A12345670
    Read  UPCA_123456789012                                             NoRead
