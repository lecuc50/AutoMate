*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}


*** Variables ***
${current_directory}         ${data_source}\\Quick_Test
*** test cases ***
ATQ_RoyalMail_PostalCode_CheckCharacter
    [Documentation]  This test case verifies check calculation and check character transmission of Royal Mail Postal code
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                   Expected result
    EnterSP	                                                $>
    Send  $CPOEN03	                                        $>
    Send  $CPRPC00	                                        $>
    Send  $CPRCT00	                                        $>
    Send  $Ar	                                            $>
    Read  Royal Mail Post has postal code format	        LU178XE2B
    Read  Royal Mail Post hasn’t postal code format	        ABCDEF1234
    Send  $S,CPRCT01,Ar	                                    $>,>,>
    Read  Royal Mail Post has postal code format	        LU178XE2BF
    Read  Royal Mail Post hasn’t postal code format	        ABCDEF1234A
    Read  $P,CPRPC01,P
    Read  $P,CPRCT00,P
    Read  Royal Mail Post has postal code format	        LU178XE2B
    Read  Royal Mail Post hasn’t postal code format
    Read  $P,CPRCT01,P
    Read  Royal Mail Post has postal code format	        LU178XE2BF
    Read  Royal Mail Post hasn’t postal code format
