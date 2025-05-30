*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}


*** Variables ***
${current_directory}         ${data_source}\\Quick_Test
*** test cases ***
ATQ_MirrorLabels1_RS232_STD
    [Documentation]  Test case checks ability that HH can read mirror 2D labels: Datamatrix and QR code
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                               Expected result
    EnterSP	                                                    $>
    Send  $CIDCO01	                                            $>
    Send  $CDMEN01	                                            $>
    Send  $CQREN01	                                            $>
    Send  $CDESA01	                                            $>
    Send  $CARMR00	                                            $>
    Send  $Ar	                                                $>
    Read  QT_DATAMATRIX	                                        Dm#%Js@%mkASFJ37h3f9JsKS
    Read  QT_QR CODE	                                        QR@#JasfkBSK14umjkfJHAn12478nasf
    Read  Mirror_No Invert_Datamatrix_Horizontal	            ${EMPTY}
    Read  Mirror_No Invert_QR Code_Horizontal	                ${EMPTY}
    Read  Mirror_Invert_Datamatrix_Horizontal	                ${EMPTY}
    Read  Mirror_Invert_QR Code_Horizontal	                    ${EMPTY}
    Send  $S,CARMR01,Ar	                                        $>,>,>
    Read  QT_DATAMATRIX	                                        ${EMPTY}
    Read  QT_QR CODE	                                        ${EMPTY}
    Read  Mirror_No Invert_Datamatrix_Horizontal	            DmABCabc
    Read  Mirror_No Invert_QR Code_Horizontal	                QRABCabc
    Send  $S,CARMR02,Ar	                                        $>,>,>
    Read  QT_DATAMATRIX	                                        Dm#%Js@%mkASFJ37h3f9JsKS
    Read  QT_QR CODE	                                        QR@#JasfkBSK14umjkfJHAn12478nasf
    Read  Mirror_No Invert_Datamatrix_Horizontal	            DmABCabc
    Read  Mirror_No Invert_QR Code_Horizontal	                QRABCabc
ATQ_MirrorLabels1_RS232_WN
    [Documentation]  Test case checks ability that HH can read mirror 2D labels: Datamatrix and QR code
    [Tags]      RS232_WN
    # Description                                               Expected result
    EnterSP	                                                    $>
    Send  $CIDCO01	                                            $>
    Send  $CDMEN01	                                            $>
    Send  $CQREN01	                                            $>
    Send  $CDESA01	                                            $>
    Send  $CARMR00	                                            $>
    Send  $Ar	                                                $>
    Read  QT_DATAMATRIX	                                        R#%Js@%mkASFJ37h3f9JsKS
    Read  QT_QR CODE	                                        U@#JasfkBSK14umjkfJHAn12478nasf
    Read  Mirror_No Invert_Datamatrix_Horizontal	            ${EMPTY}
    Read  Mirror_No Invert_QR Code_Horizontal	                ${EMPTY}
    Read  Mirror_Invert_Datamatrix_Horizontal	                ${EMPTY}
    Read  Mirror_Invert_QR Code_Horizontal	                    ${EMPTY}
    Send  $S,CARMR01,Ar	                                        $>,>,>
    Read  QT_DATAMATRIX	                                        ${EMPTY}
    Read  QT_QR CODE	                                        ${EMPTY}
    Read  Mirror_No Invert_Datamatrix_Horizontal	            RABCabc
    Read  Mirror_No Invert_QR Code_Horizontal	                UABCabc
    Send  $S,CARMR02,Ar	                                        $>,>,>
    Read  QT_DATAMATRIX	                                        R#%Js@%mkASFJ37h3f9JsKS
    Read  QT_QR CODE	                                        U@#JasfkBSK14umjkfJHAn12478nasf
    Read  Mirror_No Invert_Datamatrix_Horizontal	            RABCabc
    Read  Mirror_No Invert_QR Code_Horizontal	                UABCabc
