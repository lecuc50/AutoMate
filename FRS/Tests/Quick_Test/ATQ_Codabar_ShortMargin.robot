*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
*** Variables ***
${current_directory}         ${data_source}\\Quick_Test


*** test cases ***
ATQ_Codabar_ShortMargin_CBLO01
    [Documentation]  Test case checks the capability to decode the Codabar with short quiet zones
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                                       Expected result
    Send  $S,CCBEN01,CCBLO01,Ar						                        $>,>,>,>
    Read  Codabarwithnoquietzone_1a						                    a378591b
    Read  Codabarwithnormalquietzone_10x_atfirstside_2a						a378591b
    Read  Codabarwithnormalquietzone_10x_atlastside_2b						a378591b
    Read  Codabarwithnormalquietzone_10x_atbothsides_2c						a378591b
    Read  Codabarwithshortquietzone_3x_atfirstside_3a						a378591b
    Read  Codabarwithshortquietzone_3x_atlastside_3b						a378591b
    Read  Codabarwithshortquietzone_3x_atbothsides_3c						a378591b
    Read  Codabarwithveryshortquietzone_1x_atfirstside_4a					a378591b
    Read  Codabarwithveryshortquietzone_1x_atlastside_4b					a378591b
    Read  Codabarwithveryshortquietzone_1x_atbothsides_4c					a378591b
ATQ_Codabar_ShortMargin_CBLO02
    [Documentation]  Test case checks the capability to decode the Codabar with short quiet zones
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description
    Send  $S,CCBEN01,CCBLO02,Ar						                        $>,>,>,>
    Read  Codabarwithnoquietzone_1a						                    a378591b
    Read  Codabarwithnormalquietzone_10x_atfirstside_2a						a378591b
    Read  Codabarwithnormalquietzone_10x_atlastside_2b						a378591b
    Read  Codabarwithnormalquietzone_10x_atbothsides_2c						a378591b
    Read  Codabarwithshortquietzone_3x_atfirstside_3a						a378591b
    Read  Codabarwithshortquietzone_3x_atlastside_3b						a378591b
    Read  Codabarwithshortquietzone_3x_atbothsides_3c						a378591b
    Read  Codabarwithveryshortquietzone_1x_atfirstside_4a					a378591b
    Read  Codabarwithveryshortquietzone_1x_atlastside_4b					a378591b
    Read  Codabarwithveryshortquietzone_1x_atbothsides_4c					a378591b
ATQ_Codabar_ShortMargin_CBLO03
    [Documentation]  Test case checks the capability to decode the Codabar with short quiet zones
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description
    Send  $S,CCBEN01,CCBLO03,Ar						                        $>,>,>,>
    Read  Codabarwithnoquietzone_1a						                    a378591b
    Read  Codabarwithnormalquietzone_10x_atfirstside_2a						a378591b
    Read  Codabarwithnormalquietzone_10x_atlastside_2b						a378591b
    Read  Codabarwithnormalquietzone_10x_atbothsides_2c						a378591b
    Read  Codabarwithshortquietzone_3x_atfirstside_3a						a378591b
    Read  Codabarwithshortquietzone_3x_atlastside_3b						a378591b
    Read  Codabarwithshortquietzone_3x_atbothsides_3c						a378591b
    Read  Codabarwithveryshortquietzone_1x_atfirstside_4a					a378591b
    Read  Codabarwithveryshortquietzone_1x_atlastside_4b					a378591b
    Read  Codabarwithveryshortquietzone_1x_atbothsides_4c					a378591b
ATQ_Codabar_ShortMargin_CBLO04
    [Documentation]  Test case checks the capability to decode the Codabar with short quiet zones
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description
    Send  $S,CCBEN01,CCBLO04,Ar						                        $>,>,>,>
    Read  Codabarwithnoquietzone_1a						                    a378591b
    Read  Codabarwithnormalquietzone_10x_atfirstside_2a						a378591b
    Read  Codabarwithnormalquietzone_10x_atlastside_2b						a378591b
    Read  Codabarwithnormalquietzone_10x_atbothsides_2c						a378591b
    Read  Codabarwithshortquietzone_3x_atfirstside_3a						a378591b
    Read  Codabarwithshortquietzone_3x_atlastside_3b						a378591b
    Read  Codabarwithshortquietzone_3x_atbothsides_3c						a378591b
    Read  Codabarwithveryshortquietzone_1x_atfirstside_4a					a378591b
    Read  Codabarwithveryshortquietzone_1x_atlastside_4b					a378591b
    Read  Codabarwithveryshortquietzone_1x_atbothsides_4c					a378591b
ATQ_Codabar_ShortMargin_CBLO05
    [Documentation]  Test case checks the capability to decode the Codabar with short quiet zones
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description
    Send  $S,CCBEN01,CCBLO05,Ar						                        $>,>,>,>
    Read  Codabarwithnoquietzone_1a						                    a378591b
    Read  Codabarwithnormalquietzone_10x_atfirstside_2a						a378591b
    Read  Codabarwithnormalquietzone_10x_atlastside_2b						a378591b
    Read  Codabarwithnormalquietzone_10x_atbothsides_2c						a378591b
    Read  Codabarwithshortquietzone_3x_atfirstside_3a						a378591b
    Read  Codabarwithshortquietzone_3x_atlastside_3b						a378591b
    Read  Codabarwithshortquietzone_3x_atbothsides_3c						a378591b
    Read  Codabarwithveryshortquietzone_1x_atfirstside_4a					a378591b
    Read  Codabarwithveryshortquietzone_1x_atlastside_4b					a378591b
    Read  Codabarwithveryshortquietzone_1x_atbothsides_4c					a378591b
