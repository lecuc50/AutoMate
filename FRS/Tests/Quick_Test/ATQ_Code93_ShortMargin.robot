*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
*** Variables ***
${current_directory}         ${data_source}\\Quick_Test

*** test cases ***
ATQ_Code93_ShortMargin_C9L000
    [Documentation]  Test case checks the capability to decode the Code93 with short quiet zones
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                                   Expected result
    Send  $S,CC9EN01,CC9LO00,Ar	                                    $>,>,>,>
    Read  Code93 with very short quiet zone_1x_at last side_4b	    AAAAAA
ATQ_Code93_ShortMargin_C9L001
    [Documentation]  Test case checks the capability to decode the Code93 with short quiet zones
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                                   Expected result
    Send  $S,CC9EN01,CC9LO01,Ar	                                    $>,>,>,>
    Read  Code93 with very short quiet zone_1x_at last side_4b	    AAAAAA
    Read  Code93 with no quiet zone_1a	                            AAAAAA
    Read  Code93 with normal quiet zone _10x_at last side_2b	    AAAAAA
    Read  Code93 with normal quiet zone_10x_at both sides _2c	    AAAAAA
    Read  Code93 with normal quiet zone_10x_at first side_2a	    AAAAAA
    Read  Code93 with short quiet zone_3x_at both sides_3c	        AAAAAA
    Read  Code93 with short quiet zone_3x_at first side_3a	        AAAAAA
    Read  Code93 with short quiet zone_3x_at last side_3b	        AAAAAA
    Read  Code93 with very short quiet zone_1x_at both sides_4c	    AAAAAA
    Read  Code93 with very short quiet zone_1x_at first side_4a	    AAAAAA
ATQ_Code93_ShortMargin_C9L002
    [Documentation]  Test case checks the capability to decode the Code93 with short quiet zones
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                                   Expected result
    Send  $S,CC9EN01,CC9LO02,Ar	                                    $>,>,>,>
    Read  Code93 with very short quiet zone_1x_at last side_4b	    AAAAAA
    Read  Code93 with no quiet zone_1a	                            AAAAAA
    Read  Code93 with normal quiet zone _10x_at last side_2b	    AAAAAA
    Read  Code93 with normal quiet zone_10x_at both sides _2c	    AAAAAA
    Read  Code93 with normal quiet zone_10x_at first side_2a	    AAAAAA
    Read  Code93 with short quiet zone_3x_at both sides_3c	        AAAAAA
    Read  Code93 with short quiet zone_3x_at first side_3a	        AAAAAA
    Read  Code93 with short quiet zone_3x_at last side_3b	        AAAAAA
    Read  Code93 with very short quiet zone_1x_at both sides_4c	    AAAAAA
    Read  Code93 with very short quiet zone_1x_at first side_4a	    AAAAAA
ATQ_Code93_ShortMargin_C9L003
    [Documentation]  Test case checks the capability to decode the Code93 with short quiet zones
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                                   Expected result
    Send  $S,CC9EN01,CC9LO03,Ar	                                    $>,>,>,>
    Read  Code93 with very short quiet zone_1x_at last side_4b	    AAAAAA
    Read  Code93 with no quiet zone_1a	                            AAAAAA
    Read  Code93 with normal quiet zone _10x_at last side_2b	    AAAAAA
    Read  Code93 with normal quiet zone_10x_at both sides _2c	    AAAAAA
    Read  Code93 with normal quiet zone_10x_at first side_2a	    AAAAAA
    Read  Code93 with short quiet zone_3x_at both sides_3c	        AAAAAA
    Read  Code93 with short quiet zone_3x_at first side_3a	        AAAAAA
    Read  Code93 with short quiet zone_3x_at last side_3b	        AAAAAA
    Read  Code93 with very short quiet zone_1x_at both sides_4c	    AAAAAA
    Read  Code93 with very short quiet zone_1x_at first side_4a	    AAAAAA
ATQ_Code93_ShortMargin_C9L004
    [Documentation]  Test case checks the capability to decode the Code93 with short quiet zones
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                                   Expected result
    Send  $S,CC9EN01,CC9LO04,Ar	                                    $>,>,>,>
    Read  Code93 with very short quiet zone_1x_at last side_4b	    AAAAAA
    Read  Code93 with no quiet zone_1a	                            AAAAAA
    Read  Code93 with normal quiet zone _10x_at last side_2b	    AAAAAA
    Read  Code93 with normal quiet zone_10x_at both sides _2c	    AAAAAA
    Read  Code93 with normal quiet zone_10x_at first side_2a	    AAAAAA
    Read  Code93 with short quiet zone_3x_at both sides_3c	        AAAAAA
    Read  Code93 with short quiet zone_3x_at first side_3a	        AAAAAA
    Read  Code93 with short quiet zone_3x_at last side_3b	        AAAAAA
    Read  Code93 with very short quiet zone_1x_at both sides_4c	    AAAAAA
    Read  Code93 with very short quiet zone_1x_at first side_4a	    AAAAAA
