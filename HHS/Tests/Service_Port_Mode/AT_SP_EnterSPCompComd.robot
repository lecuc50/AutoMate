*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
Suite Teardown  Run Keywords   ExitSP
...             AND   ClosePort
*** Variables ***
${current_directory}         ${data_source}\\Service_Port_Mode


*** test cases ***
AT_SP_EnterSPCompComd
    [Documentation]  Verify that sending compound command, scanner still operate normally.
    [Tags]      RS232_STD    USB_COM     USB_CPS   Corded
    #Description                                                    Expected Result
    Send  $S,s	$>,>
    Send  $S,CIDCO01,As,r01	                                        $>,>,>,>
    Read  UPCA_123456789012	                                        A123456789012
    Send  $S,CIDCO03,As,r01	                                        $>,%
    Send  $S,CIDCO01,As,r02	                                        $>,>,>,>
    ChangeBaud    115200
    Read  UPCA_123456789012	                                        A123456789012
    Send  $cIDCO	                                                $>01
    Send  $S,CIDCO03,As,r02	                                        $>,%
    Send  $cIDCO	                                                $>01
    Send  $CIDCO00,Ar	                                            $>,>
    Read  UPCA_123456789012	                                        123456789012
    Send  $S,CIDCO02,AS,As,r01	                                    $>,>,>,>,>
    Read  UPCA_123456789012	                                        123456789012A
    Send  $S,CIDCO01,AS,As,Ar	                                    $>,>,>,>,>
    Read  UPCA_123456789012	                                        A123456789012
    Send  $cIDCO
    Send  $S,CIDCO02,AS,As,r02	                                    $>,>,>,>,>
    ChangeBaud    115200
    Read  UPCA_123456789012	                                        123456789012A
    Send  $cIDCO	                                                $>02
    Send  $ADC41238,Ar,s                                            $%
    ExitSP	                                                        $>

AT_SP_EnterSPCompComd_RS232_WN
    [Documentation]  Verify that sending compound command, scanner still operate normally.
    [Tags]      RS232_WN   Corded
    #Description                                                    Expected Result
    Send  $S,s	$>,>
    Send  $S,CIDCO01,As,r01	                                        $>,>,>,>
    Read  UPCA_123456789012	                                        A0123456789012
    Send  $S,CIDCO03,As,r01	                                        $>,%
    Send  $S,CIDCO01,As,r02	                                        $>,>,>,>
    ChangeBaud    115200
    ChangeParity    None
    Read  UPCA_123456789012	                                        A0123456789012
    Send  $cIDCO	                                                $>01
    Send  $S,CIDCO03,As,r02	                                        $>,%
    Send  $cIDCO	                                                $>01
    Send  $CIDCO00,Ar	                                            $>,>
    Read  UPCA_123456789012	                                        0123456789012
    Send  $S,CIDCO02,AS,As,r01	                                    $>,>,>,>,>
    Read  UPCA_123456789012	                                        0123456789012A
    Send  $S,CIDCO01,AS,As,Ar	                                    $>,>,>,>,>
    Read  UPCA_123456789012	                                        A0123456789012
    Send  $cIDCO
    Send  $S,CIDCO02,AS,As,r02	                                    $>,>,>,>,>
    ChangeBaud    115200
    ChangeParity    None
    Read  UPCA_123456789012	                                        0123456789012A
    Send  $cIDCO	                                                $>02
    Send  $ADC41238,Ar,s                                            $%
    ExitSP	                                                        $>

AT_SP_EnterSPCompComd_RS232_OPOS
    [Documentation]  Verify that sending compound command, scanner still operate normally.
    [Tags]      RS232_OPOS  Corded
    #Description                                                    Expected Result
    Send  $S,s	$>,>
    Send  $S,CIDCO01,As,r01	                                        $>,>,>,>
    Read  UPCA_123456789012	                                        C123456789012
    Send  $S,CIDCO03,As,r01	                                        $>,%
    Send  $S,CIDCO01,As,r02	                                        $>,>,>,>
    ChangeBaud    115200
    Read  UPCA_123456789012	                                        C123456789012
    Send  $cIDCO	                                                $>01
    Send  $S,CIDCO03,As,r02	                                        $>,%
    Send  $cIDCO	                                                $>01
    Send  $CIDCO00,Ar	                                            $>,>
    Read  UPCA_123456789012	                                        123456789012
    Send  $S,CIDCO02,AS,As,r01	                                    $>,>,>,>,>
    Read  UPCA_123456789012	                                        123456789012C
    Send  $S,CIDCO01,AS,As,Ar	                                    $>,>,>,>,>
    Read  UPCA_123456789012	                                        C123456789012
    Send  $cIDCO
    Send  $S,CIDCO02,AS,As,r02	                                    $>,>,>,>,>
    ChangeBaud    115200
    Read  UPCA_123456789012	                                        123456789012C
    Send  $cIDCO	                                                $>02
    Send  $ADC41238,Ar,s                                            $%
    ExitSP	                                                        $>

AT_SP_EnterSPCompComd_Cordless
    [Documentation]  Verify that sending compound command, scanner still operate normally.
    [Tags]      RS232_STD    USB_COM     USB_CPS   Cordless
    #Description                                                    Expected Result
    Send  $S,s	$>,>
    Send  $S,CIDCO01,As,r01	                                        $>,>,>,>
    Read  UPCA_123456789012	                                        A123456789012
    Send  $S,CIDCO03,As,r01	                                        $>,%
    Send  $S,CIDCO01,As,r02	                                        $>,>,>,>
    ChangeBaud    115200
    Read  UPCA_123456789012	                                        A123456789012
    Send  $cIDCO	                                                $>01
    Send  $S,CIDCO03,As,r02	                                        $>,%
    Send  $cIDCO	                                                $>01
    Send  $CIDCO00,Ar	                                            $>,>
    Read  UPCA_123456789012	                                        123456789012
    Send  $S,CIDCO02,AS,As,r01	                                    $>,>,>,>,>
    Read  UPCA_123456789012	                                        123456789012A
    Send  $S,CIDCO01,AS,As,Ar	                                    $>,>,>,>,>
    Read  UPCA_123456789012	                                        A123456789012
    Send  $cIDCO
    Send  $S,CIDCO02,AS,As,r02	                                    $>,>,>,>,>
    ChangeBaud    115200
    Read  UPCA_123456789012	                                        123456789012A
    Send  $cIDCO	                                                $>02
    Send  $ADC41238,Ar,s                                            $%
    ExitSP	                                                        $>
    Send  R
    Read  UPCA_123456789012	                                        123456789012A

AT_SP_EnterSPCompComd_RS232_WN_Cordless
    [Documentation]  Verify that sending compound command, scanner still operate normally.
    [Tags]      RS232_WN   Cordless
    #Description                                                    Expected Result
    Send  $S,s	$>,>
    Send  $S,CIDCO01,As,r01	                                        $>,>,>,>
    Read  UPCA_123456789012	                                        A0123456789012
    Send  $S,CIDCO03,As,r01	                                        $>,%
    Send  $S,CIDCO01,As,r02	                                        $>,>,>,>
    ChangeBaud    115200
    ChangeParity    None
    Read  UPCA_123456789012	                                        A0123456789012
    Send  $cIDCO	                                                $>01
    Send  $S,CIDCO03,As,r02	                                        $>,%
    Send  $cIDCO	                                                $>01
    Send  $CIDCO00,Ar	                                            $>,>
    Read  UPCA_123456789012	                                        0123456789012
    Send  $S,CIDCO02,AS,As,r01	                                    $>,>,>,>,>
    Read  UPCA_123456789012	                                        0123456789012A
    Send  $S,CIDCO01,AS,As,Ar	                                    $>,>,>,>,>
    Read  UPCA_123456789012	                                        A0123456789012
    Send  $cIDCO
    Send  $S,CIDCO02,AS,As,r02	                                    $>,>,>,>,>
    ChangeBaud    115200
    ChangeParity    None
    Read  UPCA_123456789012	                                        0123456789012A
    Send  $cIDCO	                                                $>02
    Send  $ADC41238,Ar,s                                            $%
    ExitSP	                                                        $>
    Send  R
    Read  UPCA_123456789012	                                        0123456789012A

AT_SP_EnterSPCompComd_RS232_OPOS_Cordless
    [Documentation]  Verify that sending compound command, scanner still operate normally.
    [Tags]      RS232_OPOS  Cordless
    #Description                                                    Expected Result
    Send  $S,s	$>,>
    Send  $S,CIDCO01,As,r01	                                        $>,>,>,>
    Read  UPCA_123456789012	                                        C123456789012
    Send  $S,CIDCO03,As,r01	                                        $>,%
    Send  $S,CIDCO01,As,r02	                                        $>,>,>,>
    ChangeBaud    115200
    Read  UPCA_123456789012	                                        C123456789012
    Send  $cIDCO	                                                $>01
    Send  $S,CIDCO03,As,r02	                                        $>,%
    Send  $cIDCO	                                                $>01
    Send  $CIDCO00,Ar	                                            $>,>
    Read  UPCA_123456789012	                                        123456789012
    Send  $S,CIDCO02,AS,As,r01	                                    $>,>,>,>,>
    Read  UPCA_123456789012	                                        123456789012C
    Send  $S,CIDCO01,AS,As,Ar	                                    $>,>,>,>,>
    Read  UPCA_123456789012	                                        C123456789012
    Send  $cIDCO
    Send  $S,CIDCO02,AS,As,r02	                                    $>,>,>,>,>
    ChangeBaud    115200
    Read  UPCA_123456789012	                                        123456789012C
    Send  $cIDCO	                                                $>02
    Send  $ADC41238,Ar,s                                            $%
    ExitSP
    Send  R
    Read  UPCA_123456789012	                                        123456789012C
