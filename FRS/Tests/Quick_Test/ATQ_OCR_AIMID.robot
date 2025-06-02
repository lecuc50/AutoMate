*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}


*** Variables ***
${current_directory}         ${data_source}\\Quick_Test
*** test cases ***
ATQ_OCR_AIMID
    [Documentation]
    ...  Defect: 152662	Misread some label have characters "O, Q"
    ...  Defect: 150709	Misread some label have characters "2"
    [Tags]      RS232_STD    RS232_OPOS  USB_COM   USB_CPS
    # Description                       Expected result
    EnterSP	$>
    Send  $CIDCO01,CAIEN01,COCENE0000000,G027241414141414141414141414141410D0D,G036642424242454545450D0D,G04624E4E4E4E4E4E4E4E4E4E0D0D,Ar	    $>,>,>,>,>,>,>
    Read  Font OCR-A	            $o]o1MQHI1836
    Read  Font OCR-B	            $p]o2ABCDEFGHIJKLMN
    Read  Font MICR	                $m]o31234567890
