*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
*** Variables ***
${current_directory}         ${data_source}\\Quick_Test

*** test cases ***
ATQ_DatamatrixMirrorInvert_ARMR00_Disable Auto read mirror barcode
    [Documentation]  HH only read invert Normal Datamatrix labels.
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                                               Expected result
    EnterSP                                                                     $>
    Send  $CDMEN01                                                              $>
    Send  $CDMDM3FFFFFFF                                                        $>
    Send  $CIPNR02                                                              $>
    Send  $CSNRM00                                                              $>
    Send  $CARMR00                                                              $>
    Send  $Ar	                                                                $>
    SetSoftTrigger  On
    Read  Invert Normal Datamatrix SQUARE	                                    Datamatrix SQUARE
    Read  Invert Normal Datamatrix RECTANGLULAR	                                Datamatrix RECTANGULAR
    Read  Mirror Datamatrix flipped vertical SQUARE                             ${EMPTY}
    Read  Invert Mirror Datamatrix flipped vertical SQUARE                      ${EMPTY}
    Read  Mirror Datamatrix flipped vertical RECTANGULAR                        ${EMPTY}
    Read  Invert Mirror Datamatrix flipped vertical RECTANGULAR                 ${EMPTY}
    Read  Mirror Datamatrix flipped horizontal SQUARE                           ${EMPTY}
    Read  Invert Mirror Datamatrix flipped horizontal SQUARE                    ${EMPTY}
    Read  Mirror Datamatrix flipped horizontal RECTANGULAR                      ${EMPTY}
    Read  Invert Mirror Datamatrix flipped horizontal RECTANGULAR               ${EMPTY}
ATQ_DatamatrixMirrorInvert_ARMR01_Enable Auto read mirror barcode
    [Documentation]  Test case checks the capability to decode Datamatrix mirror and invert code (included Square and Rectangular Datamatrix codes)
    ...  HH can read all those barcodes (mirror and invert) and transmit data to host correctly
    ...  HH can't read invert Normal Datamatrix labels.
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                                               Expected result
    EnterSP                                                                     $>
    Send  $CDMEN01                                                              $>
    Send  $CDMDM3FFFFFFF                                                        $>
    Send  $CIPNR02                                                              $>
    Send  $CSNRM00                                                              $>
    Send  $CARMR01                                                              $>
    Send  $Ar	                                                                $>
    Read  Invert Normal Datamatrix SQUARE                                       ${EMPTY}
    Read  Invert Normal Datamatrix RECTANGLULAR                                 ${EMPTY}
    Read  Mirror Datamatrix flipped vertical SQUARE	                            Datamatrix SQUARE
    Read  Invert Mirror Datamatrix flipped vertical SQUARE	                    Datamatrix SQUARE
    Read  Mirror Datamatrix flipped vertical RECTANGULAR	                    Datamatrix RECTANGULAR
    Read  Invert Mirror Datamatrix flipped vertical RECTANGULAR	                Datamatrix RECTANGULAR
    Read  Mirror Datamatrix flipped horizontal SQUARE	                        Datamatrix SQUARE
    Read  Invert Mirror Datamatrix flipped horizontal SQUARE	                Datamatrix SQUARE
    Read  Mirror Datamatrix flipped horizontal RECTANGULAR	                    Datamatrix RECTANGULAR
    Read  Invert Mirror Datamatrix flipped horizontal RECTANGULAR	            Datamatrix RECTANGULAR
ATQ_DatamatrixMirrorInvert_ARMR02_Enable both normal and mirror barcode
    [Documentation]  Test case checks the capability to decode Datamatrix mirror and invert code (included Square and Rectangular Datamatrix codes)
    ...  HH can read all those barcodes (mirror and invert) and transmit data to host correctly
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                                               Expected result
    EnterSP                                                                     $>
    Send  $CDMEN01                                                              $>
    Send  $CDMDM3FFFFFFF                                                        $>
    Send  $CIPNR02                                                              $>
    Send  $CSNRM00                                                              $>
    Send  $CARMR02                                                              $>
    Send  $Ar	                                                                $>
    Read  Invert Normal Datamatrix SQUARE	                                    Datamatrix SQUARE
    Read  Invert Normal Datamatrix RECTANGLULAR	                                Datamatrix RECTANGULAR
    Read  Mirror Datamatrix flipped vertical SQUARE	                            Datamatrix SQUARE
    Read  Invert Mirror Datamatrix flipped vertical SQUARE	                    Datamatrix SQUARE
    Read  Mirror Datamatrix flipped vertical RECTANGULAR	                    Datamatrix RECTANGULAR
    Read  Invert Mirror Datamatrix flipped vertical RECTANGULAR	                Datamatrix RECTANGULAR
    Read  Mirror Datamatrix flipped horizontal SQUARE	                        Datamatrix SQUARE
    Read  Invert Mirror Datamatrix flipped horizontal SQUARE	                Datamatrix SQUARE
    Read  Mirror Datamatrix flipped horizontal RECTANGULAR	                    Datamatrix RECTANGULAR
    Read  Invert Mirror Datamatrix flipped horizontal RECTANGULAR	            Datamatrix RECTANGULAR
    SetSoftTrigger  Off
