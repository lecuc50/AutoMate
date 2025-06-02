*** settings ***
Documentation  This test case is related to 3 defects: 67814 – 66218 – 65808.
...  Problem of Sw in this case is sending 2 special keys without normal key in the middle.
...  In this TC, we will handle 3 defects with both Prefix, Suffix and Terminals (COM & KBD)
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}


*** Variables ***
${current_directory}         ${data_source}\\Quick_Test
*** test cases ***
ATQ_LF_Prefix_Suffix_Senario1
    [Documentation]  Send Ctrl Left, Ctrl Right		(Refer: #67814, #65808). Prefix = Ctrl Left, Suffix = Ctrl Right
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                               Expected result
    EnterSP	                                                    $>
    Send  $CLFPR9D9E000000000000000000000000000000000000	    $>
    Send  $CLFSU9FA0000000000000000000000000000000000000	    $>
    Send  $Ar	                                                $>
    Read  Code_128_0	                                        \\x9d\\x9e0\\x9f\\xa0
ATQ_LF_Prefix_Suffix_Senario2
    [Documentation]  Send Ctrl Left, Ctrl Right		(Refer: #67814, #65808). Prefix = Ctrl Right, Suffix = Left
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                               Expected result
    EnterSP	                                                    $>
    Send  $CLFPR9FA0000000000000000000000000000000000000	    $>
    Send  $CLFSU9D9E000000000000000000000000000000000000	    $>
    Send  $Ar	                                                $>
    Read  Code_128_0	                                        \\x9f\\xa00\\x9d\\x9e
ATQ_LF_Prefix_Suffix_Senario3
    [Documentation]  Send Special Key + Normal Key	(Refer: #66218). Prefix = Ctrl Alt P, Suffix = Alt P
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                               Expected result
    EnterSP	                                                    $>
    Send  $CLFPR9D9B509C9E000000000000000000000000000000	    $>
    Send  $CLFSU9B509C0000000000000000000000000000000000	    $>
    Send  $Ar	                                                $>
    Read  Code_128_0	                                        \\x9d\\x9bP\\x9c\\x9e0\\x9bP\\x9c
ATQ_LF_Prefix_Suffix_Senario4
    [Documentation]  Send Special Key + Normal Key	(Refer: #66218). Prefix = Alt p, Suffix = Ctrl p
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                               Expected result
    EnterSP	                                                    $>
    Send  $CLFPR9B709C0000000000000000000000000000000000	    $>
    Send  $CLFSU9D709E0000000000000000000000000000000000	    $>
    Send  $Ar	                                                $>
    Read  Code_128_0	                                        \\x9bp\\x9c0\\x9dp\\x9e


