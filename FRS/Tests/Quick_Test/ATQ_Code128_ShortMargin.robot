*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
*** Variables ***
${current_directory}         ${data_source}\\Quick_Test

*** test cases ***
ATQ_Code128_ShortMargin_C8LO00
    [Documentation]  Test case checks the capability to decode the Code128 with short quiet zones
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                                               Expected result
    Send  $S,CC8LO00,Ar	                                                        $>,>,>
    Read  Code128_with_no_quiet_zone_1a	                                        anyValue
ATQ_Code128_ShortMargin_C8LO01
    [Documentation]  Test case checks the capability to decode the Code128 with short quiet zones
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                                               Expected result
    Send  $S,CC8LO01,Ar	                                                        $>,>,>
    Read  Code128_with_no_quiet_zone_1a	                                    0800606533
    Read  Code128_with_normal_quiet_zone_10x_at_first_side_2a	            ]C10833006065
    Read  Code128_with_normal_quiet_zone_10x_at_last_side_2b	            ]C10833006065
    Read  Code128_with_normal_quiet_zone_10x_at_both_sides_2c	            ]C10833006065
    Read  Code128_with_short_quiet_zone_3x_at_first_side_3a	                0800606533
    Read  Code128_with_short_quiet_zone_3x_at_last_side_3b	                0800606533
    Read  Code128_with_short_quiet_zone_3x_at_both_sides_3c	                0800606533
    Read  Code128_with_very_short_quiet_zone_1x_at_first_side_4a	        0800606533
    Read  Code128_with_very_short_quiet_zone_1x_at_last_side_4b	            0800606533
    Read  Code128_with_very_short_quiet_zone_1x_at_both_sides_4c	        0800606533
ATQ_Code128_ShortMargin_C8LO02
    [Documentation]  Test case checks the capability to decode the Code128 with short quiet zones
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                                               Expected result
    Send  $S,CC8LO02,Ar	                                                        $>,>,>
    Read  Code128_with_no_quiet_zone_1a	                                    0800606533
    Read  Code128_with_normal_quiet_zone_10x_at_first_side_2a	            ]C10833006065
    Read  Code128_with_normal_quiet_zone_10x_at_last_side_2b	            ]C10833006065
    Read  Code128_with_normal_quiet_zone_10x_at_both_sides_2c	            ]C10833006065
    Read  Code128_with_short_quiet_zone_3x_at_first_side_3a	                0800606533
    Read  Code128_with_short_quiet_zone_3x_at_last_side_3b	                0800606533
    Read  Code128_with_short_quiet_zone_3x_at_both_sides_3c	                0800606533
    Read  Code128_with_very_short_quiet_zone_1x_at_first_side_4a	        0800606533
    Read  Code128_with_very_short_quiet_zone_1x_at_last_side_4b	            0800606533
    Read  Code128_with_very_short_quiet_zone_1x_at_both_sides_4c	        0800606533
ATQ_Code128_ShortMargin_C8LO03
    [Documentation]  Test case checks the capability to decode the Code128 with short quiet zones
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                                               Expected result
    Send  $S,CC8LO03,Ar	                                                        $>,>,>
    Read  Code128_with_no_quiet_zone_1a	                                    0800606533
    Read  Code128_with_normal_quiet_zone_10x_at_first_side_2a	            ]C10833006065
    Read  Code128_with_normal_quiet_zone_10x_at_last_side_2b	            ]C10833006065
    Read  Code128_with_normal_quiet_zone_10x_at_both_sides_2c	            ]C10833006065
    Read  Code128_with_short_quiet_zone_3x_at_first_side_3a	                0800606533
    Read  Code128_with_short_quiet_zone_3x_at_last_side_3b	                0800606533
    Read  Code128_with_short_quiet_zone_3x_at_both_sides_3c	                0800606533
    Read  Code128_with_very_short_quiet_zone_1x_at_first_side_4a	        0800606533
    Read  Code128_with_very_short_quiet_zone_1x_at_last_side_4b	            0800606533
    Read  Code128_with_very_short_quiet_zone_1x_at_both_sides_4c	        0800606533
ATQ_Code128_ShortMargin_C8LO04
    [Documentation]  Test case checks the capability to decode the Code128 with short quiet zones
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                                           Expected result
    Send  $S,CC8LO04,Ar	                                                    $>,>,>
    Read  Code128_with_no_quiet_zone_1a	                                    0800606533
    Read  Code128_with_normal_quiet_zone_10x_at_first_side_2a	            ]C10833006065
    Read  Code128_with_normal_quiet_zone_10x_at_last_side_2b	            ]C10833006065
    Read  Code128_with_normal_quiet_zone_10x_at_both_sides_2c	            ]C10833006065
    Read  Code128_with_short_quiet_zone_3x_at_first_side_3a	                0800606533
    Read  Code128_with_short_quiet_zone_3x_at_last_side_3b	                0800606533
    Read  Code128_with_short_quiet_zone_3x_at_both_sides_3c	                0800606533
    Read  Code128_with_very_short_quiet_zone_1x_at_first_side_4a	        0800606533
    Read  Code128_with_very_short_quiet_zone_1x_at_last_side_4b	            0800606533
    Read  Code128_with_very_short_quiet_zone_1x_at_both_sides_4c	        0800606533
