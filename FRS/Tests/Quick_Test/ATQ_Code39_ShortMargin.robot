*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
*** Variables ***
${current_directory}         ${data_source}\\Quick_Test


*** test cases ***
ATQ_Code39_ShortMargin_C3LO00
    [Documentation]  Test case checks the capability to decode the Code39 with short quiet zones
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                                       Expected result
    Send  $S,CC3LO00,Ar	$>,>,>
    Read  Code39 with no quiet zone (1a)	                            +A+B+C+D<space>
ATQ_Code39_ShortMargin_C3LO01
    [Documentation]  Test case checks the capability to decode the Code39 with short quiet zones
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                                       Expected result
    Send  $S,CC3LO01,Ar	$>,>,>
    Read  Code39 with no quiet zone (1a)	                            +A+B+C+D<space>
    Read  Code39 with normal quiet zone (10x) at first side (2a)	    +A+B+C+D<space>
    Read  Code39 with normal quiet zone (10x) at last side (2b)	        +A+B+C+D<space>
    Read  Code39 with normal quiet zone (10x) at both sides (2c)	    +A+B+C+D<space>
    Read  Code39 with short quiet zone (3x) at first side (3a)	        +A+B+C+D<space>
    Read  Code39 with short quiet zone (3x) at last side (3b)	        +A+B+C+D<space>
    Read  Code39 with short quiet zone (3x) at both sides (3c)	        +A+B+C+D<space>
    Read  Code39 with very short quiet zone (1x) at first side (4a)	    +A+B+C+D<space>
    Read  Code39 with very short quiet zone (1x) at last side (4b)	    +A+B+C+D<space>
    Read  Code39 with very short quiet zone (1x) at both sides (4c)	    +A+B+C+D<space>
ATQ_Code39_ShortMargin_C3LO02
    [Documentation]  Test case checks the capability to decode the Code39 with short quiet zones
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                                       Expected result
    Send  $S,CC3LO02,Ar	$>,>,>
    Read  Code39 with no quiet zone (1a)	                            +A+B+C+D<space>
    Read  Code39 with normal quiet zone (10x) at first side (2a)	    +A+B+C+D<space>
    Read  Code39 with normal quiet zone (10x) at last side (2b)	        +A+B+C+D<space>
    Read  Code39 with normal quiet zone (10x) at both sides (2c)	    +A+B+C+D<space>
    Read  Code39 with short quiet zone (3x) at first side (3a)	        +A+B+C+D<space>
    Read  Code39 with short quiet zone (3x) at last side (3b)	        +A+B+C+D<space>
    Read  Code39 with short quiet zone (3x) at both sides (3c)	        +A+B+C+D<space>
    Read  Code39 with very short quiet zone (1x) at first side (4a)	    +A+B+C+D<space>
    Read  Code39 with very short quiet zone (1x) at last side (4b)	    +A+B+C+D<space>
    Read  Code39 with very short quiet zone (1x) at both sides (4c)	    +A+B+C+D<space>
ATQ_Code39_ShortMargin_C3LO03
    [Documentation]  Test case checks the capability to decode the Code39 with short quiet zones
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                                       Expected result
    Send  $S,CC3LO03,Ar	                                                $>,>,>
    Read  Code39 with no quiet zone (1a)	                            +A+B+C+D<space>
    Read  Code39 with normal quiet zone (10x) at first side (2a)	    +A+B+C+D<space>
    Read  Code39 with normal quiet zone (10x) at last side (2b)	        +A+B+C+D<space>
    Read  Code39 with normal quiet zone (10x) at both sides (2c)	    +A+B+C+D<space>
    Read  Code39 with short quiet zone (3x) at first side (3a)	        +A+B+C+D<space>
    Read  Code39 with short quiet zone (3x) at last side (3b)	        +A+B+C+D<space>
    Read  Code39 with short quiet zone (3x) at both sides (3c)	        +A+B+C+D<space>
    Read  Code39 with very short quiet zone (1x) at first side (4a)	    +A+B+C+D<space>
    Read  Code39 with very short quiet zone (1x) at last side (4b)	    +A+B+C+D<space>
    Read  Code39 with very short quiet zone (1x) at both sides (4c)	    +A+B+C+D<space>
ATQ_Code39_ShortMargin_C3LO04
    [Documentation]  Test case checks the capability to decode the Code39 with short quiet zones
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                                       Expected result
    Send  $S,CC3LO04,Ar	                                                $>,>,>
    Read  Code39 with no quiet zone (1a)	                            +A+B+C+D<space>
    Read  Code39 with normal quiet zone (10x) at first side (2a)	    +A+B+C+D<space>
    Read  Code39 with normal quiet zone (10x) at last side (2b)	        +A+B+C+D<space>
    Read  Code39 with normal quiet zone (10x) at both sides (2c)	    +A+B+C+D<space>
    Read  Code39 with short quiet zone (3x) at first side (3a)	        +A+B+C+D<space>
    Read  Code39 with short quiet zone (3x) at last side (3b)	        +A+B+C+D<space>
    Read  Code39 with short quiet zone (3x) at both sides (3c)	        +A+B+C+D<space>
    Read  Code39 with very short quiet zone (1x) at first side (4a)	    +A+B+C+D<space>
    Read  Code39 with very short quiet zone (1x) at last side (4b)	    +A+B+C+D<space>
    Read  Code39 with very short quiet zone (1x) at both sides (4c)	    +A+B+C+D<space>
ATQ_Code39_ShortMargin_C3LO05
    [Documentation]  Test case checks the capability to decode the Code39 with short quiet zones
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                                       Expected result
    Send  $S,CC3LO05,Ar	                                                $>,>,>
    Read  Code39 with no quiet zone (1a)	                            +A+B+C+D<space>
    Read  Code39 with normal quiet zone (10x) at first side (2a)	    +A+B+C+D<space>
    Read  Code39 with normal quiet zone (10x) at last side (2b)	        +A+B+C+D<space>
    Read  Code39 with normal quiet zone (10x) at both sides (2c)	    +A+B+C+D<space>
    Read  Code39 with short quiet zone (3x) at first side (3a)	        +A+B+C+D<space>
    Read  Code39 with short quiet zone (3x) at last side (3b)	        +A+B+C+D<space>
    Read  Code39 with short quiet zone (3x) at both sides (3c)	        +A+B+C+D<space>
    Read  Code39 with very short quiet zone (1x) at first side (4a)	    +A+B+C+D<space>
    Read  Code39 with very short quiet zone (1x) at last side (4b)	    +A+B+C+D<space>
    Read  Code39 with very short quiet zone (1x) at both sides (4c)	    +A+B+C+D<space>
