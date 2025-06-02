*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
*** Variables ***
${current_directory}         ${data_source}\\Quick_Test


*** test cases ***
ATQ_Code39CheckDigit_Standard
    [Documentation]  Verify that SUT can decodes all check digit of Code 39 exactly
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                   Expected result
    Send  $S,CIDCO01,CAIEN01,Ar                     $>,>,>,>
    Send  $S,CC3FA01,CC3CC01,Ar                     $>,>,>,>   #Enable Code 39 Full ASCII Decoding and Enables Standard Check Digit for Code 39
    Read  Code39_Mod43_ABCDEFW	                    *]A1ABCDEFW
    Read  Code39_FullASCII_Mod43_ABCabcH	        *]A5ABCabcH
    IF    '${interface_name}' == 'RS232_WN'
        Read  Code39_Mod43_ABCDEFW	                M]A1ABCDEFW
        Read  Code39_FullASCII_Mod43_ABCabcH	    M]A5ABCabcH
    END
    IF    '${interface_name}' == 'RS232_OPOS'
        Read  Code39_Mod43_ABCDEFW	                V]A1ABCDEFW
        Read  Code39_FullASCII_Mod43_ABCabcH	    V]A5ABCabcH
    END

ATQ_Code39CheckDigit_LaPoste
    [Documentation]  Verify that SUT can decodes all check digit of Code 39 exactly
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                               Expected result
    Send  $S,CIDCO01,CAIEN01,Ar                     $>,>,>,>
    Send  $S,CC3FA01,CLPEN01,CC3CC01,Ar	            $>,>,>,>,>     # Enables Code 39 LaPoste Check Digit
    Read  Code39_LaPoste_CK1	                    $Y]A1RA123456785FR OR/ $a]A1RA123456785FR
    Read  Code39_PZN_CK1                            ${EMPTY}

ATQ_Code39CheckDigit_PZN
    [Documentation]  Verify that SUT can decodes all check digit of Code 39 exactly
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                               Expected result
    Send  $S,CIDCO01,CAIEN01,Ar                     $>,>,>,>
    Send  $S,CC3FA01,CPZEN01,CC3CC01,Ar             $>,>,>,>,>          # Enables Code 39 LaPoste Check Digit
    Read  Code39_LaPoste_CK1	                    $Y]A1RA123456785FR OR/ $a]A1RA123456785FR
    Read  Code39_PZN_CK1	                        $Z]A1-1234562
