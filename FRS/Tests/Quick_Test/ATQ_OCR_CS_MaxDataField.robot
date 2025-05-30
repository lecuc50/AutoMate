*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}


*** Variables ***
${current_directory}         ${data_source}\\Quick_Test
*** test cases ***
Verfiy scanner can setting one OCR word with maximum 70 Data Field
    [Documentation]  Check maximum number of data field of Customer Structure OCR is 80 data field for each row
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                                                               Expected result
    EnterSP	                                                                                    $>
    Send  $COCEN10000000	                                                                    $>
    Send  $G014242424242424242424242424242424242424242424242424242424242424242420D0D	        $>
    Send  $Ar	                                                                                $>
    Read  OCR_1A	                                                                            ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456
    Read  OCR_1B	                                                                            789ABCDEFGHIJKLMNOPQRSTUVWXYZABCD
Verfiy scanner can setting two OCR word with maximum 80 Data Field for one row
    [Documentation]  Check maximum number of data field of Customer Structure OCR is 80 data field for each row
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                                                               Expected result
    EnterSP	                                                                                    $>
    Send  $COCEN10000000	                                                                    $>
    Send  $G01424242204242422042424220424242204242422042424220424242204242420D0D	            $>
    Send  $Ar	                                                                                $>
    Read  OCR_2	                                                                                ABC DEF GHI JKL MNO PQR STU VWX
Verify scanner can read two line with maximum character of each line
    [Documentation]  Check maximum number of data field of Customer Structure OCR is 80 data field for each row
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                                                               Expected result
    EnterSP	                                                                                    $>
    Send  $COCEN10000000	                                                                    $>
    Send  $G01424242424242424242424242424242426E424242424242424242424242424242420D0D	        $>
    Send  $Ar	                                                                                $>
    Read  OCR_3	                                                                                ABCDEFGHIJKLMNOP\r\nQRSTUVWXYZ012345
Verify scanner can read OCR word with length is 70 chars
    [Documentation]  Check maximum number of data field of Customer Structure OCR is 80 data field for each row
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                                                               Expected result
    EnterSP	                                                                                    $>
    Send  $COCEN10000000	                                                                    $>
    Send  $G01424242424242424242424242424242424242424242424242424242424242424242424242424242424242424242424242424242424242424242424242424242424242424242420D0D	        $>
    Send  $Ar	                                                                                $>
    Read  OCR_4	                                                                                ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGH
Verify scanner can read long OCR label (from customer)
    [Documentation]  Check maximum number of data field of Customer Structure OCR is 80 data field for each row
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                                                               Expected result
    EnterSP	                                                                                    $>
    Send  $COCEN10000000	                                                                    $>
    Send  $G017241454141414E4E4E4E4E4E4E4E4E4541414E4E45454545454545454545456E4E4E4E4E4E4E4E414E4E4E4E4E4E4E41414145454545454545454545454E6E4242424242424242424242424242424242424242424242424242424242420D0D	$>
    Send  $Ar	                                                                                $>
    Read  OCR_5	                                                                                I<PRT113017022<ZX47<<<<<<<<<<<\r\n7806289M2902186PRT<<<<<<<<<<<4\r\nDA<CUNHA<GUIMARAES<<PEDRO<MIGU
Verify scanner can read car certificate Frence (from customer defect 101270)
    [Documentation]  Check maximum number of data field of Customer Structure OCR is 80 data field for each row
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                                                               Expected result
    Send  $S,COCEN10000000,G0172414141414141414E4E4E414142424242424242424242424242424242424242424242424242424242424242426E414142424242424242424242424242424242424242424242424242424242424E4E4E4E41414E4E4E4E4E4E4E0D0D,Ar	    $>,>,>,>
    Read  OCR_6
