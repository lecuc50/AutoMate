*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
*** Variables ***
${current_directory}         ${data_source}\\Quick_Test

*** test cases ***
Scenario 1: Disable Mirror_Aztec Structure Append
    [Documentation]  HH can read completely Aztec Structure Append symbologies and Mirror
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                         Expected result
    EnterSP	                                                    $>
    Send  $CDESA01	                                            $>
    Send  $CAZEN01	                                            $>
    Send  $CARMR00	                                            $>
    Send  $Ar	                                                $>
    Read  AztecStructureAppend_123                          ${EMPTY}
    Read  AztecStructureAppend_456                          ${EMPTY}
    Read  AztecStructureAppend_789	                        123456789
    WaitSecond    2
    Read  Mirror_Aztec_StructureAppend1_123                 ${EMPTY}
    Read  Mirror_Aztec_StructureAppend2_456                 ${EMPTY}
    Read  Mirror_Aztec_StructureAppend3_789                 123456789
    [Teardown]  WaitSecond    2
Scenario 2: Enable Mirror_Aztec Structure Append
    [Documentation]  HH can read completely Normal and Mirror Aztec Structure Append
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                         Expected result
    EnterSP	                                                    $>
    Send  $CDESA01	                                            $>
    Send  $CAZEN01	                                            $>
    Send  $CARMR01	                                            $>
    Send  $Ar	                                                $>
    Read  AztecStructureAppend_123                          ${EMPTY}
    Read  AztecStructureAppend_456                          ${EMPTY}
    Read  AztecStructureAppend_789                          123456789
    WaitSecond    2
    Read  Mirror_Aztec_StructureAppend1_123                 ${EMPTY}
    Read  Mirror_Aztec_StructureAppend2_456                 ${EMPTY}
    Read  Mirror_Aztec_StructureAppend3_789                 123456789
    [Teardown]  WaitSecond    2
Scenario 3: Enable Mirror And Normal_Aztec Structure Append
    [Documentation]  HH can read completely Aztec Structure Append symbologies and Mirror
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                         Expected result
    EnterSP	                                                    $>
    Send  $CDESA01	                                            $>
    Send  $CAZEN01	                                            $>
    Send  $CARMR02	                                            $>
    Send  $Ar	                                                $>
    Read  AztecStructureAppend_123                          ${EMPTY}
    Read  AztecStructureAppend_456                          ${EMPTY}
    Read  AztecStructureAppend_789	                        123456789
    WaitSecond    2
    Read  Mirror_Aztec_StructureAppend1_123                 ${EMPTY}
    Read  Mirror_Aztec_StructureAppend2_456                 ${EMPTY}
    Read  Mirror_Aztec_StructureAppend3_789                 123456789
    [Teardown]  WaitSecond    2

Scenario 4: Disable Mirror_Datamatrix Structure Append
    [Documentation]  Can't read Mirror Datamatrix Append only
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                         Expected result
    EnterSP	                                                    $>
    Send  $CDESA01	                                            $>
    Send  $CDMEN01	                                            $>
    Send  $CARMR00	                                            $>
    Send  $Ar	                                                $>
    Read  DatamatrixStructureAppend_000                     ${EMPTY}
    Read  DatamatrixStructureAppend_123                     ${EMPTY}
    Read  DatamatrixStructureAppend_456                     ${EMPTY}
    Read  DatamatrixStructureAppend_789	                    123456789000
    WaitSecond    2
    Read  Mirror_Datamatrix_StructureAppend1_000            ${EMPTY}
    Read  Mirror_Datamatrix_StructureAppend2_123            ${EMPTY}
    Read  Mirror_Datamatrix_StructureAppend3_456            ${EMPTY}
    Read  Mirror_Datamatrix_StructureAppend4_789            ${EMPTY}
    [Teardown]  WaitSecond    2
Scenario 5: Enable Mirror_Datamatrix Structure Append
    [Documentation]  HH can read completely Mirror Datamatrix Structure Append symbologies only
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                         Expected result
    EnterSP	                                                    $>
    Send  $CDESA01	                                            $>
    Send  $CDMEN01	                                            $>
    Send  $CARMR01	                                            $>
    Send  $Ar	                                                $>
    Read  DatamatrixStructureAppend_000                         ${EMPTY}
    Read  DatamatrixStructureAppend_123                         ${EMPTY}
    Read  DatamatrixStructureAppend_456                         ${EMPTY}
    Read  DatamatrixStructureAppend_789                         ${EMPTY}
    WaitSecond    2
    Read  Mirror_Datamatrix_StructureAppend1_000                ${EMPTY}
    Read  Mirror_Datamatrix_StructureAppend2_123                ${EMPTY}
    Read  Mirror_Datamatrix_StructureAppend3_456                ${EMPTY}
    Read  Mirror_Datamatrix_StructureAppend4_789            000123456789
    [Teardown]  WaitSecond    2
Scenario 6: Enable Mirror And Normal_Datamatrix Structure Append
    [Documentation]  HH can read completely Datamatrix Structure Append symbologies and Mirror
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                         Expected result
    EnterSP	                                                    $>
    Send  $CDESA01	                                            $>
    Send  $CDMEN01	                                            $>
    Send  $CARMR02	                                            $>
    Send  $Ar	                                                $>
    Read  DatamatrixStructureAppend_000
    Read  DatamatrixStructureAppend_123
    Read  DatamatrixStructureAppend_456
    Read  DatamatrixStructureAppend_789	                        123456789000
    WaitSecond    2
    Read  Mirror_Datamatrix_StructureAppend1_000
    Read  Mirror_Datamatrix_StructureAppend2_123
    Read  Mirror_Datamatrix_StructureAppend3_456
    Read  Mirror_Datamatrix_StructureAppend4_789                000123456789
    [Teardown]  WaitSecond    2
Scenario 7: Disable Mirror_QRCode Structure Append
    [Documentation]  HH can read completely QRCode Structure Append symbologies
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                         Expected result
    EnterSP	                                                    $>
    Send  $CDESA01	                                            $>
    Send  $CQREN01	                                            $>
    Send  $CARMR00	                                            $>
    Send  $Ar	                                                $>
    Read  QRCodeStructureAppend_123                         ${EMPTY}
    Read  QRCodeStructureAppend_456                         ${EMPTY}
    Read  QRCodeStructureAppend_abc                         ${EMPTY}
    Read  QRCodeStructureAppend_def	                        123abc456def
    WaitSecond    2
    Read  Mirror_QRCode_StructureAppend1_123                ${EMPTY}
    Read  Mirror_QRCode_StructureAppend2_456                ${EMPTY}
    Read  Mirror_QRCode_StructureAppend3_abc                ${EMPTY}
    Read  Mirror_QRCode_StructureAppend4_def                ${EMPTY}
    [Teardown]  WaitSecond    2
Scenario 8: Enable Mirror_QRCode Structure Append
    [Documentation]  HH can read completely Mirro QRCode Structure Append symbologies only
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                         Expected result
    EnterSP	                                                    $>
    Send  $CDESA01	                                            $>
    Send  $CQREN01	                                            $>
    Send  $CARMR01	                                            $>
    Send  $Ar	                                                $>
    Read  QRCodeStructureAppend_123                             ${EMPTY}
    Read  QRCodeStructureAppend_456                             ${EMPTY}
    Read  QRCodeStructureAppend_abc                         ${EMPTY}
    Read  QRCodeStructureAppend_def	                        ${EMPTY}
    WaitSecond    2
    Read  Mirror_QRCode_StructureAppend1_123                ${EMPTY}
    Read  Mirror_QRCode_StructureAppend2_456                ${EMPTY}
    Read  Mirror_QRCode_StructureAppend3_abc                ${EMPTY}
    Read  Mirror_QRCode_StructureAppend4_def                123456abcdef
    [Teardown]  WaitSecond    2
Scenario 9: Enable Mirror and Normal_QRCode Structure Append
    [Documentation]  HH can read completely QRCode Structure Append symbologies and Mirror
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                         Expected result
    EnterSP	                                                    $>
    Send  $CDESA01	                                            $>
    Send  $CQREN01	                                            $>
    Send  $CARMR02	                                            $>
    Send  $Ar	                                                $>
    Read  QRCodeStructureAppend_123                         ${EMPTY}
    Read  QRCodeStructureAppend_456                         ${EMPTY}
    Read  QRCodeStructureAppend_abc                         ${EMPTY}
    Read  QRCodeStructureAppend_def	                        123abc456def
    WaitSecond    2
    Read  Mirror_QRCode_StructureAppend1_123                ${EMPTY}
    Read  Mirror_QRCode_StructureAppend2_456                ${EMPTY}
    Read  Mirror_QRCode_StructureAppend3_abc                ${EMPTY}
    Read  Mirror_QRCode_StructureAppend4_def                123456abcdef
    [Teardown]  WaitSecond    2
Scenario 10: Disable Mirror_MacroPDF417 Structure Append
    [Documentation]  HH can read completely MacroPDF417 Structure Append symbologies
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                         Expected result
    EnterSP	                                                    $>
    Send  $CDESA01	                                            $>
    Send  $CP4EN01	                                            $>
    Send  $CARMR00	                                            $>
    Send  $Ar	                                                $>
    Read  MacroPDF417StructureAppend_123                        ${EMPTY}
    Read  MacroPDF417StructureAppend_456                        ${EMPTY}
    Read  MacroPDF417StructureAppend_789                        ${EMPTY}
    Read  MacroPDF417StructureAppend_abc	                    123456789abc
    WaitSecond    2
    Read  Mirror_MacroPDF417_StructureAppend1_123               ${EMPTY}
    Read  Mirror_MacroPDF417_StructureAppend2_456               ${EMPTY}
    Read  Mirror_MacroPDF417_StructureAppend3_789               ${EMPTY}
    Read  Mirror_MacroPDF417_StructureAppend4_abc               123456789abc
    [Teardown]  WaitSecond    2
Scenario 11: Enable Mirror_MacroPDF417 Structure Append
    [Documentation]  HH can read completely Normal and Mirror MacroPDF417 Structure Append symbologies only
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                         Expected result
    EnterSP	                                                    $>
    Send  $CDESA01	                                            $>
    Send  $CP4EN01	                                            $>
    Send  $CARMR00	                                            $>
    Send  $Ar	                                                $>
    Read  MacroPDF417StructureAppend_123                        ${EMPTY}
    Read  MacroPDF417StructureAppend_456                        ${EMPTY}
    Read  MacroPDF417StructureAppend_789                        ${EMPTY}
    Read  MacroPDF417StructureAppend_abc	                    123456789abc
    WaitSecond    2
    Read  Mirror_MacroPDF417_StructureAppend1_123               ${EMPTY}
    Read  Mirror_MacroPDF417_StructureAppend2_456               ${EMPTY}
    Read  Mirror_MacroPDF417_StructureAppend3_789               ${EMPTY}
    Read  Mirror_MacroPDF417_StructureAppend4_abc               123456789abc
    [Teardown]  WaitSecond    2
Scenario 12: Enable Mirror and Normal_MacroPDF417 Structure Append
    [Documentation]  HH can read completely MacroPDF417 Structure Append symbologies
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                         Expected result
    EnterSP	                                                    $>
    Send  $CDESA01	                                            $>
    Send  $CP4EN01	                                            $>
    Send  $CARMR00	                                            $>
    Send  $Ar	                                                $>
    Read  MacroPDF417StructureAppend_123                        ${EMPTY}
    Read  MacroPDF417StructureAppend_456                        ${EMPTY}
    Read  MacroPDF417StructureAppend_789                        ${EMPTY}
    Read  MacroPDF417StructureAppend_abc	                    123456789abc
    WaitSecond    2
    Read  Mirror_MacroPDF417_StructureAppend1_123               ${EMPTY}
    Read  Mirror_MacroPDF417_StructureAppend2_456               ${EMPTY}
    Read  Mirror_MacroPDF417_StructureAppend3_789               ${EMPTY}
    Read  Mirror_MacroPDF417_StructureAppend4_abc               123456789abc
    [Teardown]  WaitSecond    2