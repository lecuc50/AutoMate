*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
*** Variables ***
${current_directory}         ${data_source}\\Quick_Test

*** test cases ***
ATQ_GS1_Datamatrix_Scenario1
    [Documentation]  This test case verify AIM ID of GS1 DataMatrix & GS1 QR
    ...   - Enable: label ID as suffix
    ...   - Enable DM/QR decoding
    ...   - Enable Structure Append
    ...   AIM ID of Global = E  Datamatrix =D  GS1Datamatrix=D
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                           Expected result
    EnterSP					                                $>
    Send  $CDMEN01					                        $>
    Send  $CAIEN01					                        $>
    Send  $CDMAI00					                        $>
    Send  $CGDAI00					                        $>
    Send  $CIDCO01					                        $>
    Send  $CDESA01					                        $>
    Send  $CSNRM00					                        $>
    Send  $Ar					                            $>
    SetSoftTrigger  On
    Read  FNC1 in second position_no ECI_Industry		    Dm]d3Aa2BbCc
    Read  ECC 200_FNC1 in first position					Dg]d2123456789
    Read  ECC 200_FNC1 in fifth position_1
    Read  ECC 200_FNC1 in fifth position_2					Dg]d2123456
    SetSoftTrigger  Off
ATQ_GS1_Datamatrix_Scenario2
    [Documentation]  This test case verify AIM ID of GS1 DataMatrix & GS1 QR
    ...   - Enable: label ID as suffix
    ...   - Enable DM decoding
    ...   - Enable Structure Append
    ...   AIM ID of Global = E  Datamatrix =D  GS1Datamatrix=E
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                           Expected result
    EnterSP					                                $>
    Send  $CDMEN01					                        $>
    Send  $CAIEN01					                        $>
    Send  $CDMAI00					                        $>
    Send  $CGDAI01					                        $>
    Send  $CIDCO01					                        $>
    Send  $CDESA01					                        $>
    Send  $CSNRM00					                        $>
    Send  $Ar					                            $>
    SetSoftTrigger  On
    Read  FNC1 in second position_no ECI_Industry		    Dm]d3Aa2BbCc
    Read  ECC 200_FNC1 in first position					Dg]d2123456789
    Read  ECC 200_FNC1 in fifth position_1                  ${EMPTY}
    Read  ECC 200_FNC1 in fifth position_2					Dg]d2123456
    SetSoftTrigger  Off
ATQ_GS1_Datamatrix_Scenario3
    [Documentation]  This test case verify AIM ID of GS1 DataMatrix & GS1 QR
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                           Expected result
    EnterSP					                                $>
    Send  $CDMEN01					                        $>
    Send  $CAIEN01					                        $>
    Send  $CDMAI01					                        $>
    Send  $CGDAI00					                        $>
    Send  $CIDCO01					                        $>
    Send  $CDESA01					                        $>
    Send  $CSNRM00					                        $>
    Send  $Ar					                            $>
    SetSoftTrigger  On
    Read  FNC1 in second position_no ECI_Industry		    Dm]d3Aa2BbCc
    Read  ECC 200_FNC1 in first position					Dg]d2123456789
    Read  ECC 200_FNC1 in fifth position_1                  ${EMPTY}
    Read  ECC 200_FNC1 in fifth position_2					Dg]d2123456
    SetSoftTrigger  Off
ATQ_GS1_Datamatrix_Scenario4
    [Documentation]  This test case verify AIM ID of GS1 DataMatrix & GS1 QR
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                           Expected result
    EnterSP					                                $>
    Send  $CDMEN01					                        $>
    Send  $CAIEN01					                        $>
    Send  $CDMAI01					                        $>
    Send  $CGDAI01					                        $>
    Send  $CIDCO01					                        $>
    Send  $CDESA01					                        $>
    Send  $CSNRM00					                        $>
    Send  $Ar					                            $>
    SetSoftTrigger  On
    Read  FNC1 in second position_no ECI_Industry			Dm]d3Aa2BbCc
    Read  ECC 200_FNC1 in first position					Dg]d2123456789
    Read  ECC 200_FNC1 in fifth position_1                  ${EMPTY}
    Read  ECC 200_FNC1 in fifth position_2					Dg]d2123456
    SetSoftTrigger  Off
ATQ_GS1_Datamatrix_Scenario5
    [Documentation]  This test case verify AIM ID of GS1 DataMatrix & GS1 QR
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                           Expected result
    EnterSP					                                $>
    Send  $CDMEN01					                        $>
    Send  $CAIEN00					                        $>
    Send  $CDMAI01					                        $>
    Send  $CGDAI01					                        $>
    Send  $CIDCO01					                        $>
    Send  $CDESA01					                        $>
    Send  $CSNRM00					                        $>
    Send  $Ar					                            $>
    SetSoftTrigger  On
    Read  FNC1 in second position_no ECI_Industry			Dm]d3Aa2BbCc
    Read  ECC 200_FNC1 in first position					Dg]d2123456789
    Read  ECC 200_FNC1 in fifth position_1                  ${EMPTY}
    Read  ECC 200_FNC1 in fifth position_2					Dg]d2123456
    SetSoftTrigger  Off
ATQ_GS1_Datamatrix_Scenario6
    [Documentation]  This test case verify AIM ID of GS1 DataMatrix & GS1 QR
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                           Expected result
    EnterSP					                                $>
    Send  $CDMEN01					                        $>
    Send  $CAIEN00					                        $>
    Send  $CDMAI01					                        $>
    Send  $CGDAI00					                        $>
    Send  $CIDCO01					                        $>
    Send  $CDESA01					                        $>
    Send  $CSNRM00					                        $>
    Send  $Ar					                            $>
    SetSoftTrigger  On
    Read  FNC1 in second position_no ECI_Industry		    Dm]d3Aa2BbCc
    Read  ECC 200_FNC1 in first position					Dg123456789
    Read  ECC 200_FNC1 in fifth position_1                  ${EMPTY}
    Read  ECC 200_FNC1 in fifth position_2					Dg123456
    SetSoftTrigger  Off
ATQ_GS1_Datamatrix_Scenario7
    [Documentation]  This test case verify AIM ID of GS1 DataMatrix & GS1 QR
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                           Expected result
    EnterSP					                                $>
    Send  $CDMEN01					                        $>
    Send  $CAIEN00					                        $>
    Send  $CDMAI00					                        $>
    Send  $CGDAI01					                        $>
    Send  $CIDCO01					                        $>
    Send  $CDESA01					                        $>
    Send  $CSNRM00					                        $>
    Send  $Ar					                            $>
    SetSoftTrigger  On
    Read  FNC1 in second position_no ECI_Industry			DmAa2BbCc
    Read  ECC 200_FNC1 in first position					Dg]d2123456789
    Read  ECC 200_FNC1 in fifth position_1                  ${EMPTY}
    Read  ECC 200_FNC1 in fifth position_2					Dg]d2123456
    SetSoftTrigger  Off
ATQ_GS1_Datamatrix_Scenario8
    [Documentation]  This test case verify AIM ID of GS1 DataMatrix & GS1 QR
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                           Expected result
    EnterSP					                                $>
    Send  $CDMEN01					                        $>
    Send  $CAIEN00					                        $>
    Send  $CDMAI00					                        $>
    Send  $CGDAI00					                        $>
    Send  $CIDCO01					                        $>
    Send  $CDESA01					                        $>
    Send  $CSNRM00					                        $>
    Send  $Ar					                            $>
    SetSoftTrigger  On
    Read  FNC1 in second position_no ECI_Industry			DmAa2BbCc
    Read  ECC 200_FNC1 in first position					Dg123456789
    Read  ECC 200_FNC1 in fifth position_1                  ${EMPTY}
    Read  ECC 200_FNC1 in fifth position_2					Dg123456
    SetSoftTrigger  Off
ATQ_GS1_Datamatrix_Scenario9
    [Documentation]  This test case verify AIM ID of GS1 DataMatrix & GS1 QR
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                           Expected result
    EnterSP					                                $>
    Send  $CDMEN01					                        $>
    Send  $CAIEN00					                        $>
    Send  $CDMAI00					                        $>
    Send  $CGDAI00					                        $>
    Send  $CIDCO01					                        $>
    Send  $CDESA01					                        $>
    Send  $CSNRM00					                        $>
    Send  $CGDID475331                                      $>
    Send  $Ar					                            $>
    SetSoftTrigger  On
    Read  FNC1 in second position_no ECI_Industry			DmAa2BbCc
    Read  ECC 200_FNC1 in first position					GS1123456789
    Read  ECC 200_FNC1 in fifth position_1                  ${EMPTY}
    Read  ECC 200_FNC1 in fifth position_2					GS1123456
    SetSoftTrigger  Off
ATQ_GS1_Datamatrix_Scenario10
    [Documentation]  Disable Datamatrix. Verify that the HH can't read any GS1 DataMatrix
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                           Expected result
    EnterSP					                                $>
    Send  $CDMEN00					                        $>
    Send  $CAIEN00					                        $>
    Send  $CDMAI00					                        $>
    Send  $CGDAI00					                        $>
    Send  $CIDCO01					                        $>
    Send  $CDESA01					                        $>
    Send  $CSNRM00					                        $>
    Send  $CGDID475331                                      $>
    Send  $Ar					                            $>
    Read  $P,CDMEN00,CAIEN00,CDMAI00,CGDAI00,CIDCO01,CDESA01,CSNRM00,CGDID475331,P
    SetSoftTrigger  On
    Read  FNC1 in second position_no ECI_Industry
    Read  ECC 200_FNC1 in first position
    Read  ECC 200_FNC1 in fifth position_1
    Read  ECC 200_FNC1 in fifth position_2
    SetSoftTrigger  Off
