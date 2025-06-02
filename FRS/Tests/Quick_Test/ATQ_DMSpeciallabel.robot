*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
*** Variables ***
${current_directory}         ${data_source}\\Quick_Test

*** test cases ***
ATQ_DMSpeciallabel
    [Documentation]  Verify that the HH isn't hang up when read Special DM label. Jazz #139170
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description          Expected result
    EnterSP	                    $>
    Send  $AR	                $>
    Send  $Er	                $>
    Send  $CSNDR03	            $>
    Send  $Ar	                $>
    FOR    ${counter}    IN RANGE    0    100    1
        Read  ASENDIA_Barcode	        CONTAINS: 756900031513010000000000000000000000000000000000000000000000
    END
    Read  DatamatrixCustom1	    20190820B01;1990784;015883;018920;025655;026118;026123;026124;026126;025917;025928;025930;025931;025938;026165;025756;027070;027507;027877;028489;028568;028677;028712;028716;028717;028757
    Read  Datamatrix_abcabc     ABCabc
    CheckReset	                        1



