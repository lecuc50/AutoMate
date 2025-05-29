*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}


*** Variables ***
${current_directory}         ${data_source}\\Quick_Test
*** test cases ***
ATQ_OCR_LabelID
    [Documentation]  Check scanner can decode OCR inverted
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                                   Expected result
    EnterSP	                                                        $>
    Send  $CIDCO01,COCEN70000000,G017241414141414141414141414141410D0D,G026642424242454545450D0D,G03624E4E4E4E4E4E4E4E4E4E0D0D,Ar	    $>,>,>,>,>,>
    Read  Font OCR-A	                                            $oMQHI1836
    Read  Font OCR-B	                                            $pABCDEFGHIJKLMN
    Read  Font MICR	                                                $m1234567890
    EnterSP	                                                        $>
    Send  $COAID246100,COBID246200,COMID246300,Ar	                $>,>,>,>
    Read  Font OCR-A_MQHIL836	                                    $aMQHI1836
    Read  Font OCR-B_ABCDEFGHIJKLMN	                                $bABCDEFGHIJKLMN
    Read  Font MICR_1234567890	                                    $c1234567890

