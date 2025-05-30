*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
*** Variables ***
${current_directory}         ${data_source}\\Quick_Test

*** test cases ***
ATQ_GS1_QR_Scenario1
    [Documentation]  This test case verify AIM ID of GS1 DataMatrix & GS1 QR
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                     Expected result
    EnterSP					            $>
    Send  $CQREN01					    $>
    Send  $CAIEN01					    $>
    Send  $CQRAI00					    $>
    Send  $CGQAI00					    $>
    Send  $CIDCO01					    $>
    Send  $CDESA01					    $>
    Send  $CSNRM00					    $>
    Send  $Ar					        $>
    SetSoftTrigger  On
    Read  QRCode_GS1					QG]Q3ABCabc
    Read  QRCode_GS1_ECL				QG]Q4\\\\00000354321
    Read  QRCode_123456789				QR]Q1123456789
ATQ_GS1_QR_Scenario2
    [Documentation]  This test case verify AIM ID of GS1 DataMatrix & GS1 QR
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                     Expected result
    EnterSP					            $>
    Send  $CQREN01					    $>
    Send  $CAIEN01					    $>
    Send  $CQRAI00					    $>
    Send  $CGQAI01					    $>
    Send  $CIDCO01					    $>
    Send  $CDESA01					    $>
    Send  $CSNRM00					    $>
    Send  $Ar					        $>
    SetSoftTrigger  On
    Read  QRCode_GS1					QG]Q3ABCabc
    Read  QRCode_GS1_ECL				QG]Q4\\\\00000354321
    Read  QRCode_123456789				QR]Q1123456789
ATQ_GS1_QR_Scenario3
    [Documentation]  This test case verify AIM ID of GS1 DataMatrix & GS1 QR
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                     Expected result
    EnterSP					            $>
    Send  $CQREN01					    $>
    Send  $CAIEN01					    $>
    Send  $CQRAI01					    $>
    Send  $CGQAI00					    $>
    Send  $CIDCO01					    $>
    Send  $CDESA01					    $>
    Send  $CSNRM00					    $>
    Send  $Ar					        $>
    SetSoftTrigger  On
    Read  QRCode_GS1					QG]Q3ABCabc
    Read  QRCode_GS1_ECL				QG]Q4\\\\00000354321
    Read  QRCode_123456789				QR]Q1123456789
ATQ_GS1_QR_Scenario4
    [Documentation]  This test case verify AIM ID of GS1 DataMatrix & GS1 QR
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                     Expected result
    EnterSP					            $>
    Send  $CQREN01					    $>
    Send  $CAIEN01					    $>
    Send  $CQRAI01					    $>
    Send  $CGQAI01					    $>
    Send  $CIDCO01					    $>
    Send  $CDESA01					    $>
    Send  $CSNRM00					    $>
    Send  $Ar					        $>
    SetSoftTrigger  On
    Read  QRCode_GS1					QG]Q3ABCabc
    Read  QRCode_GS1_ECL				QG]Q4\\\\00000354321
    Read  QRCode_123456789				QR]Q1123456789
ATQ_GS1_QR_Scenario5
    [Documentation]  This test case verify AIM ID of GS1 DataMatrix & GS1 QR
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                     Expected result
    EnterSP					            $>
    Send  $CQREN01					    $>
    Send  $CAIEN00					    $>
    Send  $CQRAI01					    $>
    Send  $CGQAI01					    $>
    Send  $CIDCO01					    $>
    Send  $CDESA01					    $>
    Send  $CSNRM00					    $>
    Send  $Ar					        $>
    SetSoftTrigger  On
    Read  QRCode_GS1					QG]Q3ABCabc
    Read  QRCode_GS1_ECL				QG]Q4\\\\00000354321
    Read  QRCode_123456789				QR]Q1123456789
ATQ_GS1_QR_Scenario6
    [Documentation]  This test case verify AIM ID of GS1 DataMatrix & GS1 QR
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                     Expected result
    EnterSP					            $>
    Send  $CQREN01					    $>
    Send  $CAIEN00					    $>
    Send  $CQRAI01					    $>
    Send  $CGQAI00					    $>
    Send  $CIDCO01					    $>
    Send  $CDESA01					    $>
    Send  $CSNRM00					    $>
    Send  $Ar					        $>
    SetSoftTrigger  On
    Read  QRCode_GS1					QGABCabc
    Read  QRCode_GS1_ECL				QG\\\\00000354321
    Read  QRCode_123456789				QR]Q1123456789
ATQ_GS1_QR_Scenario7
    [Documentation]  This test case verify AIM ID of GS1 DataMatrix & GS1 QR
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                     Expected result
    EnterSP					            $>
    Send  $CQREN01					    $>
    Send  $CAIEN00					    $>
    Send  $CQRAI00					    $>
    Send  $CGQAI01					    $>
    Send  $CIDCO01					    $>
    Send  $CDESA01					    $>
    Send  $CSNRM00					    $>
    Send  $Ar					        $>
    SetSoftTrigger  On
    Read  QRCode_GS1					QG]Q3ABCabc
    Read  QRCode_GS1_ECL				QG]Q4\\\\00000354321
    Read  QRCode_123456789				QR123456789
ATQ_GS1_QR_Scenario8
    [Documentation]  This test case verify AIM ID of GS1 DataMatrix & GS1 QR
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                     Expected result
    EnterSP					            $>
    Send  $CQREN01					    $>
    Send  $CAIEN00					    $>
    Send  $CQRAI00					    $>
    Send  $CGQAI00					    $>
    Send  $CIDCO01					    $>
    Send  $CDESA01					    $>
    Send  $CSNRM00					    $>
    Send  $Ar					        $>
    SetSoftTrigger  On
    Read  QRCode_GS1					QGABCabc
    Read  QRCode_GS1_ECL				QG\\\\00000354321
    Read  QRCode_123456789				QR123456789
ATQ_GS1_QR_Scenario9
    [Documentation]  This test case verify AIM ID of GS1 DataMatrix & GS1 QR
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                     Expected result
    EnterSP					            $>
    Send  $CQREN01					    $>
    Send  $CAIEN00					    $>
    Send  $CQRAI00					    $>
    Send  $CGQAI00					    $>
    Send  $CIDCO01					    $>
    Send  $CDESA01					    $>
    Send  $CSNRM00					    $>
    Send  $CGQID475331                  $>
    Send  $Ar					        $>
    SetSoftTrigger  On
    Read  QRCode_GS1					GS1ABCabc
    Read  QRCode_GS1_ECL				GS1\\\\00000354321
    Read  QRCode_123456789				QR123456789
ATQ_GS1_QR_Scenario10
    [Documentation]  This test case verify disable QR code will not able read  GS1 QR
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                     Expected result
    EnterSP					            $>
    Send  $CQREN00					    $>
    Send  $CAIEN00					    $>
    Send  $CQRAI00					    $>
    Send  $CGQAI00					    $>
    Send  $CIDCO01					    $>
    Send  $CDESA01					    $>
    Send  $CSNRM00					    $>
    Send  $CGQID475331                  $>
    Send  $Ar					        $>
    SetSoftTrigger  On
    Read  QRCode_GS1
    Read  QRCode_GS1_ECL
    Read  QRCode_123456789
    SetSoftTrigger  Off
