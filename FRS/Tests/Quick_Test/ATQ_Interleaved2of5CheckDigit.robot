*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}


*** Variables ***
${current_directory}         ${data_source}\\Quick_Test
*** test cases ***
ATQ_Interleaved2of5CheckDigit_Decoding
    [Documentation]  Verify check digit of Interleaved 2of5
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                               Expected result
    EnterSP	                                                            $>
    Send  $CI2EN01	                                                    $>
    Send  $CI2CC01	                                                    $>
    Send  $Ar	                                                        $>
    Read  Interleaved 2 of 5_Check Digit Standard                   	0001124804
    Send  $S,CI2CC02,Ar	                                                $>,>,>
    Read  Interleaved 2 of 5_Check Digit German Parcel              	07630562025290
    Send  $S,CI2CC04,Ar	                                                $>,>,>
    Read  Interleaved 2 of 5_Check Digit DHL                        	763056202523
    Send  $S,CI2CC08,Ar	                                                $>,>,>
    Read  Interleaved 2 of 5_Check Digit Daimer Chrysler            	190383277885
    Send  $S,CI2CC10,Ar	                                                $>,>,>
    Read  Interleaved 2 of 5_Check Digit Bosch                      	4756872322
    Send  $S,CI2CC20,Ar	                                                $>,>,>
    Read  Interleaved 2 of 5_Check Digit ItalianPost                	123456789125
ATQ_Interleaved2of5CheckDigit_Formatting
    [Documentation]  Verify Formatting of check digit of Interleaved 2of5
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                               Expected result
    EnterSP	                                                            $>
    Send  $CIDCO02	                                                    $>
    Send  $CAIEN01	                                                    $>
    Send  $CLFPR61415F0000000000000000000000000000000000	            $>
    Send  $CLFSU5F5A7A0D00000000000000000000000000000000	            $>
    Send  $CLFCA02	                                                    $>
    Send  $CLFCH31413242FFFFFFFF	                                    $>
    Send  $Ar	                                                        $>
    EnterSP	                                                            $>
    Send  $CI2EN01	                                                    $>
    Send  $CI2CC01	                                                    $>
    Send  $Ar	                                                        $>
    Read  Interleaved 2 of 5_Check Digit Standard                   	aA_]I1000AAB4804i_Zz
    Send  $S,CI2CC02,Ar	                                                $>,>,>
    Read  Interleaved 2 of 5_Check Digit German Parcel              	aA_]I10763056B0B5B90i_Zz
    Send  $S,CI2CC04,Ar	                                                $>,>,>
    Read  Interleaved 2 of 5_Check Digit DHL                        	aA_]I1763056B0B5B3i_Zz
    Send  $S,CI2CC08,Ar	                                                $>,>,>
    Read  Interleaved 2 of 5_Check Digit Daimer Chrysler            	aA_]I1A90383B77885i_Zz
    Send  $S,CI2CC10,Ar	                                                $>,>,>
    Read  Interleaved 2 of 5_Check Digit Bosch                          aA_]I1475687B3BBi_Zz
    Send  $S,CI2CC20,Ar	                                                $>,>,>
    Read  Interleaved 2 of 5_Check Digit ItalianPost                	aA_]I1AB3456789AB5i_Zz
