*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}


*** Variables ***
${current_directory}         ${data_source}\\Quick_Test
*** test cases ***
ATQ_TacoBell
    [Documentation]  This feature allows the user to specify the area of the acquired image (starting from the geometrical center) on which the histogram is calculated. This is useful in scenarios where a spot evaluation of the exposure in the center of the image is preferred (such as reading from a mobile device with a bright background around).
    ...  This feature is implemented from Miki_C M24, and Miki_wireless M27 + HH 25
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS
    # Description                                   Expected result
    EnterSP	                                        $>
    Send  $CQREN01	                                $>
    Send  $Ar	                                    $>
    Read  Tacobel_003	                                HTTP://SCN.BY/9T9AB0HTW8J3EC
    Read  Tacobel_005	                                https://itunes.apple.com/en/app/secret-menu-for-taco-bell/id1048956004
    Read  Tacobel_007	                                HTTP://SCN.BY/9T9AB0HTW8J3ED
    Read  Tacobel_008	                                Pro Tip: Don't use QR Codes to convey messages for birthday, holiday, or get well soon cards.
    Read  Tacobel_009	                                HTTP://SCN.BY/9T9AB0HTW8J3EC
    Read  $P,CSPSE01,P
    Read  Tacobel_003	                                HTTP://SCN.BY/9T9AB0HTW8J3EC
    Read  Tacobel_005	                                https://itunes.apple.com/en/app/secret-menu-for-taco-bell/id1048956004
    Read  Tacobel_007	                                HTTP://SCN.BY/9T9AB0HTW8J3ED
    Read  Tacobel_008	                                Pro Tip: Don't use QR Codes to convey messages for birthday, holiday, or get well soon cards.
    Read  Tacobel_009	                                HTTP://SCN.BY/9T9AB0HTW8J3EC
