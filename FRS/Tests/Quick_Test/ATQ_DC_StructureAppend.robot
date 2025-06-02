*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
*** Variables ***
${current_directory}         ${data_source}\\Quick_Test

*** test cases ***
Scenario 1: Aztec Structure Append
    [Documentation]  HH can read completely Aztec Structure Append symbologies
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                         Expected result
    EnterSP	                                                    $>
    Send  $CDESA01	                                            $>
    Send  $CAZEN01	                                            $>
    Send  $Ar	                                                $>
    Read  AztecStructureAppend_123
    Read  AztecStructureAppend_456
    Read  AztecStructureAppend_789	                        123456789
    [Teardown]  WaitSecond    2

Scenario 2: Datamatrix Structure Append
    [Documentation]  HH can read completely Datamatrix Structure Append symbologies
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                         Expected result
    EnterSP	                                                    $>
    Send  $CDESA01	                                            $>
    Send  $CDMEN01	                                            $>
    Send  $Ar	                                                $>
    Read  DatamatrixStructureAppend_000
    Read  DatamatrixStructureAppend_123
    Read  DatamatrixStructureAppend_456
    Read  DatamatrixStructureAppend_789	                    123456789000
    [Teardown]  WaitSecond    2
Scenario 3: QRCode Structure Append
    [Documentation]  HH can read completely Aztec Structure Append symbologies
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                         Expected result
    EnterSP	                                                    $>
    Send  $CDESA01	                                            $>
    Send  $CQREN01	                                            $>
    Send  $Ar	                                                $>
    Read  QRCodeStructureAppend_123
    Read  QRCodeStructureAppend_456
    Read  QRCodeStructureAppend_abc
    Read  QRCodeStructureAppend_def	                        123abc456def
    [Teardown]  WaitSecond    2
Scenario 4: MacroPDF417 Structure Append
    [Documentation]  HH can read completely MacroPDF417 Structure Append symbologies
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                         Expected result
    EnterSP	                                                    $>
    Send  $CDESA01	                                            $>
    Send  $CP4EN01	                                            $>
    Send  $Ar	                                                $>
    Read  MacroPDF417StructureAppend_123
    Read  MacroPDF417StructureAppend_456
    Read  MacroPDF417StructureAppend_789
    Read  MacroPDF417StructureAppend_abc	                    123456789abc
    [Teardown]  WaitSecond    2
Scenario 5: MicroPDF417 Structure Append
    [Documentation]  HH can read completely MicroPDF417 Structure Append symbologies
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                         Expected result
    EnterSP	                                                    $>
    Send  $CDESA01	                                            $>
    Send  $CMIEN01	                                            $>
    Send  $Ar	                                                $>
    Read  MicroPDF417StructureAppend_abc
    Read  MicroPDF417StructureAppend_def
    Read  MicroPDF417StructureAppend_ghi
    Read  MicroPDF417StructureAppend_klm	                    abcdefghiklm
    [Teardown]  WaitSecond    2
Scenario 6: A new sequence will break structure append sequence
    [Documentation]  Verify new behavior of structure append labels. Read a new sequence
    ...   (for ex.: Aztec structure append) will break another structure append sequence (example: data matrix)
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                         Expected result
    EnterSP	                                                    $>
    Send  $CDESA01	                                            $>
    Send  $CAZEN01	                                            $>
    Send  $CDMEN01	                                            $>
    Send  $CQREN01	                                            $>
    Send  $CMQEN01	                                            $>
    Send  $CMXEN01	                                            $>
    Send  $CP4EN01	                                            $>
    Send  $CMIEN01	                                            $>
    Send  $Ar	                                                $>
    Read  AztecStructureAppend_123
    Read  DatamatrixStructureAppend_000
    Read  DatamatrixStructureAppend_123
    Read  DatamatrixStructureAppend_456
    Read  DatamatrixStructureAppend_789	                    123456789000
    Read  DatamatrixStructureAppend_000
    Read  DatamatrixStructureAppend_123
    Read  MicroPDF417StructureAppend_abc
    Read  MicroPDF417StructureAppend_def
    Read  MicroPDF417StructureAppend_ghi
    Read  MicroPDF417StructureAppend_klm	               abcdefghiklm
    Read  DatamatrixStructureAppend_456
    Read  DatamatrixStructureAppend_789                     ${EMPTY}
    Read  MacroPDF417StructureAppend_123
    Read  MacroPDF417StructureAppend_456
    Read  QRCodeStructureAppend_123
    Read  QRCodeStructureAppend_456
    Read  MacroPDF417StructureAppend_789
    Read  MacroPDF417StructureAppend_abc                    ${EMPTY}
    Read  QRCodeStructureAppend_abc
    Read  QRCodeStructureAppend_def                         ${EMPTY}
    [Teardown]  WaitSecond    2
Scenario 7: Structure append sequence will be not broken by single label.
    [Documentation]  Verify new behavior of structure append labels is not broken by single label.
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                         Expected result
    EnterSP	                                                    $>
    Send  $CDESA01	                                            $>
    Send  $CAZEN01	                                            $>
    Send  $CDMEN01	                                            $>
    Send  $CQREN01	                                            $>
    Send  $CMQEN01	                                            $>
    Send  $CMXEN01	                                            $>
    Send  $CP4EN01	                                            $>
    Send  $CMIEN01	                                            $>
    Send  $Ar	                                                $>
    Read  AztecStructureAppend_123
    Read  AztecStructureAppend_456
    Read  $CMIEN01
    Read  AztecStructureAppend_789	                        123456789
    Read  DatamatrixStructureAppend_123
    Read  DatamatrixStructureAppend_456
    Read  DatamatrixStructureAppend_789
    Read  abcabc	                                        ABCabc
    Read  DatamatrixStructureAppend_000	                    123456789000
    Read  MacroPDF417StructureAppend_123
    Read  QR_abcabc	                                        abcabc
    Read  MacroPDF417StructureAppend_456
    Read  MacroPDF417StructureAppend_789
    Read  MacroPDF417StructureAppend_abc	                123456789abc
    Read  MicroPDF417StructureAppend_abc
    Read  MicroPDF417StructureAppend_def
    Read  MicroPDF417StructureAppend_ghi
    Read  Datamatrix_abcabc	                                ABCabc
    Read  MicroPDF417StructureAppend_klm	                abcdefghiklm
    Read  QRCodeStructureAppend_123
    Read  QRCodeStructureAppend_456
    Read  QR_abcdef	                                        abcdef
    Read  QRCodeStructureAppend_abc
    Read  QRCodeStructureAppend_def	                        123abc456def
    [Teardown]  WaitSecond    2
Scenario 8: HH will be enter label programming when $P is read in Structure Append sequence
    [Documentation]  HH goes into label programming if $P label programming is read
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                         Expected result
    EnterSP	                                                    $>
    Send  $CDESA01	                                            $>
    Send  $CAZEN01	                                            $>
    Send  $CDMEN01	                                            $>
    Send  $CQREN01	                                            $>
    Send  $CMQEN01	                                            $>
    Send  $CMXEN01	                                            $>
    Send  $CP4EN01	                                            $>
    Send  $CMIEN01	                                            $>
    Send  $Ar	                                                $>
    Read  AztecStructureAppend_123
    Read  AztecStructureAppend_456
    Read  $P,CQREN01,P
    Read  AztecStructureAppend_789	                        123456789
    Read  DatamatrixStructureAppend_000
    Read  $P
    SetSoftTrigger    On
    Read  $CABEN00
    Read  $P
    Read  UPCA_123456789012                                 ${EMPTY}
    Read  DatamatrixStructureAppend_123
    Read  DatamatrixStructureAppend_456
    Read  DatamatrixStructureAppend_789                     123456789000
    SetSoftTrigger    Off
    [Teardown]  WaitSecond    2


