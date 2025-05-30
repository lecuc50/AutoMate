*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
*** Variables ***
${current_directory}         ${data_source}\\Quick_Test

*** test cases ***
ATQ_DoubleRead_SNRM00
    [Documentation]  Verify double read issue
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                           Expected result
    Send  $S,CSNRM00,CSNDRFF,Ar	                            $>,>,>,>
    SetSoftTrigger  On
    Read  UPCA_123456789012	                                123456789012
    GetDataFromHost                                         ${EMPTY}
    GetDataFromHost                                         ${EMPTY}
    GetDataFromHost                                         ${EMPTY}
    GetDataFromHost                                         ${EMPTY}
    SetSoftTrigger  Off
ATQ_DoubleRead_SNRM01
    [Documentation]  Verify double read issue
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                           Expected result
    Send  $S,CSNRM01,CSNDRFF,Ar	                            $>,>,>,>
    SetSoftTrigger  On
    Read  UPCA_123456789012	                                123456789012
    GetDataFromHost                                         ${EMPTY}
    GetDataFromHost                                         ${EMPTY}
    GetDataFromHost                                         ${EMPTY}
    GetDataFromHost                                         ${EMPTY}
    SetSoftTrigger  Off
ATQ_DoubleRead_SNRM02
    [Documentation]  Verify double read issue
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                           Expected result
    Send  $S,CSNRM02,CSNDRFF,Ar	$>,>,>,>
    SetSoftTrigger  On
    Read  UPCA_123456789012	                                123456789012
    GetDataFromHost                                         ${EMPTY}
    GetDataFromHost                                         ${EMPTY}
    GetDataFromHost                                         ${EMPTY}
    GetDataFromHost                                         ${EMPTY}
    SetSoftTrigger  Off
ATQ_DoubleRead_SNRM03
    [Documentation]  Verify double read issue
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                           Expected result
    Send  $S,CSNRM03,CSNDRFF,CSNFN20,Ar	                    $>,>,>,>,>
    Read  UPCA_123456789012	                                123456789012
    WaitSecond    3
    GetDataFromHost                                         ${EMPTY}
    Read  UPCA_123456789012	                                123456789012
    WaitSecond    3
    GetDataFromHost                                         ${EMPTY}
ATQ_DoubleRead_SNRM04
    [Documentation]  Verify double read issue
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                           Expected result
    Read  $P,CSNRM04,P
    Read  UPCA_123456789012	                                123456789012
    GetDataFromHost                                         ${EMPTY}
    GetDataFromHost                                         ${EMPTY}
    GetDataFromHost                                         ${EMPTY}
    GetDataFromHost                                         ${EMPTY}
ATQ_DoubleRead_SNRM05
    [Documentation]  Verify double read issue
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                           Expected result
    Send  $S,CSNRM05,CSNDRFF,Ar	                            $>,>,>,>
    SetSoftTrigger  On
    Read  UPCA_123456789012	                                123456789012
    GetDataFromHost                                         ${EMPTY}
    GetDataFromHost                                         ${EMPTY}
    GetDataFromHost                                         ${EMPTY}
    GetDataFromHost                                         ${EMPTY}
    SetSoftTrigger  Off

