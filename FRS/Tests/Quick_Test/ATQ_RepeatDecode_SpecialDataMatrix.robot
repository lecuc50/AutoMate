*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}


*** Variables ***
${current_directory}         ${data_source}\\Quick_Test
*** test cases ***
ATQ_RepeatDecode_SpecialDataMatrix_Corded
    [Documentation]  This test case verify that HH does not fall to bad behavior after read special label 100
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                   Expected result
    EnterSP	                                        $>
    Send  $AR	                                    $>
    Send  $Er	                                    $>
    ExitSP	                                        $>
    FOR    ${counter}    IN RANGE    1    100    1
        Read  SpecialDataMatrix	        756900031513010000000000000000000000000000000000000000000000
    END
    CheckReset	 0
ATQ_RepeatDecode_SpecialDataMatrix_Cordless
    [Documentation]  This test case verify that HH does not fall to bad behavior after read special label 100
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS  Cordless
    # Description                                   Expected result
    EnterSP	                $>
    Send  $AR	            $>
    Send  $Er	            $>
    Send  ${brigde_mode}    [GUN] $>
    Send  $S	            [GUN] $>
    Send  $AR	            [GUN] $>
    Send  $Er	            [GUN] $>
    Send  $s	            [GUN] $>
    Send  $ER0	            $>
    ExitSP	                $>
    FOR    ${counter}    IN RANGE    1    100    1
        Read  SpecialDataMatrix	        756900031513010000000000000000000000000000000000000000000000
    END
    CheckReset	 0


