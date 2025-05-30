*** settings ***
Resource  ../Root_path.resource
Resource    ../../Resources/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
*** Variables ***
${current_directory}         ${data_source}\\Quick_Test


*** test cases ***
ATQ_AddOn_Timer_SNRM00
    [Documentation]  Verify that the HH doesn’t read twice (with and without AddOn) when reading a Add On label
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                       Expected result
    EnterSP						        $>
    Send  $CABEN01					    $>
    Send  $CEBEN01					    $>
    Send  $C8BEN01					    $>
    Send  $C3BEN01					    $>
    Send  $C3BIN01					    $>
    Send  $C3BIS01					    $>
    Send  $CADO201					    $>
    Send  $CADO501					    $>
    Send  $CADOT1E					    $>
    Send  $CSNRM00					    $>
    Send  $Ar					        $>
    SetSoftTrigger    On
    Read  UPCA_AddOn2_12345678901212				12345678901212
    Read  UPCA_AddOn5_12345678901212345				12345678901212345
    Read  UPCE_AddOn2_0234567389				    0234567389
    Read  UPCE_AddOn5_0234567389759				    0234567389759
    Read  EAN8_AddOn2_1234567012				    1234567012
    Read  EAN8_AddOn5_1234567012345				    1234567012345
    Read  EAN13_AddOn2_123456789012812				123456789012812
    Read  EAN13_AddOn5_123456789012812345			123456789012812345
    Read  ISBN13_AddOn5_978817525766512345			817525766012345
    Read  ISSN_AddOn2_977123456789812				1234567912
    SetSoftTrigger    Off
ATQ_AddOn_Timer_SNRM05
    [Documentation]  Verify that the HH doesn’t read twice (with and without AddOn) when reading a Add On label
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                       Expected result
    EnterSP						        $>
    Send  $CABEN01					    $>
    Send  $CEBEN01					    $>
    Send  $C8BEN01					    $>
    Send  $C3BEN01					    $>
    Send  $C3BIN01					    $>
    Send  $C3BIS01					    $>
    Send  $CADO201					    $>
    Send  $CADO501					    $>
    Send  $CADOT1E					    $>
    Send  $CSNRM05					    $>
    Send  $Ar					        $>
    Read  UPCA_AddOn2_12345678901212				12345678901212
    Read  UPCA_AddOn5_12345678901212345				12345678901212345
    Read  UPCE_AddOn2_0234567389				    0234567389
    Read  UPCE_AddOn5_0234567389759				    0234567389759
    Read  EAN8_AddOn2_1234567012				    1234567012
    Read  EAN8_AddOn5_1234567012345				    1234567012345
    Read  EAN13_AddOn2_123456789012812				123456789012812
    Read  EAN13_AddOn5_123456789012812345			123456789012812345
    Read  ISBN13_AddOn5_978817525766512345			817525766012345
    Read  ISSN_AddOn2_977123456789812				1234567912
ATQ_AddOn_Timer_SNRM03
    [Documentation]  Verify that the HH doesn’t read twice (with and without AddOn) when reading a Add On label
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                       Expected result
    EnterSP						        $>
    Send  $CABEN01					    $>
    Send  $CEBEN01					    $>
    Send  $C8BEN01					    $>
    Send  $C3BEN01					    $>
    Send  $C3BIN01					    $>
    Send  $C3BIS01					    $>
    Send  $CADO201					    $>
    Send  $CADO501					    $>
    Send  $CADOT1E					    $>
    Send  $CSNRM03					    $>
    Send  $Ar					        $>
    Read  UPCA_AddOn2_12345678901212				12345678901212
    Read  UPCA_AddOn5_12345678901212345				12345678901212345
    Read  UPCE_AddOn2_0234567389				    0234567389
    Read  UPCE_AddOn5_0234567389759				    0234567389759
    Read  EAN8_AddOn2_1234567012				    1234567012
    Read  EAN8_AddOn5_1234567012345				    1234567012345
    Read  EAN13_AddOn2_123456789012812				123456789012812
    Read  EAN13_AddOn5_123456789012812345			123456789012812345
    Read  ISBN13_AddOn5_978817525766512345			817525766012345
    Read  ISSN_AddOn2_977123456789812				1234567912
