*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}


*** Variables ***
${current_directory}         ${data_source}\\Quick_Test
*** test cases ***
Scenario 1: Remove letter
    [Documentation]  Check all control field (space, start / stop removal) can be inserted into Data Field.
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                          Expected result
    EnterSP	                                                $>
    Send  $HA00	                                            $>
    Send  $COCEN80000000	                                $>
    Send  $G04664242414242204E4E53416F4E4E0D0D	            $>
    Send  $COCCF46	                                        $>
    Send  $CSNRM03	                                        $>
    Send  $Ar	                                            $>
    Read  OCR-A_ABCDE 1234	                                ABCDE 1234
Scenario 2: Remove space
    [Documentation]  Check all control field (space, start / stop removal) can be inserted into Data Field.
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                          Expected result
    EnterSP	                                                $>
    Send  $HA00	                                            $>
    Send  $COCEN40000000	                                $>
    Send  $G0372424241424253206F4E4E414E4E0D0D	            $>
    Send  $COCCF46	                                        $>
    Send  $CSNRM03	                                        $>
    Send  $Ar	                                            $>
    Read  OCR-B_ABCDE12F34	                                ABCDE12F34
Scenario 3: Remove Symbol
    [Documentation]  Check all control field (space, start / stop removal) can be inserted into Data Field.
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                          Expected result
    EnterSP	                                                $>
    Send  $HA00	                                            $>
    Send  $COCEN40000000	                                $>
    Send  $G03664242414242204E4E53596F4E4E0D0D	            $>
    Send  $COCCF46	                                        $>
    Send  $CSNRM03	                                        $>
    Send  $Ar	                                            $>
    Read  OCR-A_ABCDE 1234nho	                            ABCDE 1234
    Read  OCR-A_FGHIJ 1234	                                FGHIJ 1234
    Read  OCR-A_KLMNO 1234	                                KLMNO 1234
    Read  OCR-A_PQRST 1234	                                PQRST 1234
Scenario 4: Multi removal
    [Documentation]  Check all control field (space, start / stop removal) can be inserted into Data Field.
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                          Expected result
    EnterSP	                                                $>
    Send  $HA00	                                            $>
    Send  $COCEN40000000	                                $>
    Send  $G0372424241424253206F4E4E53596F4E4E0D0D	        $>
    Send  $COCCF46	                                        $>
    Send  $CSNRM03	                                        $>
    Send  $Ar	                                            $>
    Read  OCR-B_ABCDE 1234	                                ABCDE1234
    Read  OCR-B_FGHIJ1234	                                FGHIJ1234
    Read  OCR-B_KLMNO1234	                                KLMNO1234
    Read  OCR-B_PQRST1234	                                PQRST 1234
Scenario 5: Remove at first/end position
    [Documentation]  Check all control field (space, start / stop removal) can be inserted into Data Field.
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                          Expected result
    EnterSP	                                                $>
    Send  $HA00	                                            $>
    Send  $COCEN20000000	                                $>
    Send  $G026253416F42424242424253416F0D0D	            $>
    Send  $COCCF46	                                        $>
    Send  $CSNRM03	                                        $>
    Send  $Ar	                                            $>
    Read  MICR_123456	                                    123456
    Read  MICR_789012	                                    789012
