*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}


*** Variables ***
${current_directory}         ${data_source}\\Quick_Test
*** test cases ***
Scenario 1: Verify default OCR font with all supported charset
    [Documentation]  Check scanner can read OCR-A font , OCR-B font, MICR font with corresponding configuration
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                          Expected result
    EnterSP			                                        $>
    Send  $COCEN10000000,G0141414141414141414141414141410D0D,COCCF46,Ar			$>,>,>,>
    Read  Font OCR-B_Letter1			                    ABCDEFGHIJKLMN
    Read  Font OCR-B_ExtendedNumeric
    Read  Font OCR-B_Letter2			                    OPQRSTUVWXYZ<A
    Read  Font OCR-B_Alphanumerical1
    Read  Font OCR-B_Alphanumerical2
    Read  Font OCR-B_Symbolo&Number1
    Read  Font OCR-B_Symbolo&Number2
    EnterSP			                                        $>
    Send  $COCEN20000000,G024242424242424242424242424242424242424242424242420D0D,COCCF46,Ar			$>,>,>,>
    Read  Font OCR-B_Letter1
    Read  Font OCR-B_ExtendedNumeric
    Read  Font OCR-B_Letter2
    Read  Font OCR-B_Alphanumerical1			0A1B2C3D4E5F6G7H8I9J0K1L
    Read  Font OCR-B_Alphanumerical2			0K1L2M3N4O5P6Q7R8S9TUV<<
    Read  Font OCR-B_Symbolo&Number1
    Read  Font OCR-B_Symbolo&Number2
    EnterSP			                                                        $>
    Send  $COCEN40000000,G0345454545454545454545450D0D,COCCF46,Ar			$>,>,>,>
    Read  Font OCR-B_Letter1
    Read  Font OCR-B_ExtendedNumeric			0123456789<
    Read  Font OCR-B_Letter2
    Read  Font OCR-B_Alphanumerical1
    Read  Font OCR-B_Alphanumerical2
    Read  Font OCR-B_Symbolo&Number1
    Read  Font OCR-B_Symbolo&Number2
Scenario 2: Verify OCR-A font (66) with all supported charset
    [Documentation]  Check scanner can read OCR-A font , OCR-B font, MICR font with corresponding configuration
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                          Expected result
    EnterSP			                                                $>
    Send  $COCEN80000000,G044E4E4E4E4E59590D0D,COCCF46,Ar			$>,>,>,>
    Read  Font OCR-B_Letter1
    Read  Font OCR-B_ExtendedNumeric
    Read  Font OCR-B_Letter2
    Read  Font OCR-B_Alphanumerical1
    Read  Font OCR-B_Alphanumerical2
    Read  Font OCR-B_Symbolo&Number1			            12345<<
    Read  Font OCR-B_Symbolo&Number2			            67890<<
    EnterSP			$>
    Send  $COCEN80000000,G046641414141414141414141414141410D0D,COCCF46,Ar			$>,>,>,>
    Read  Font OCR-A_Letter1			ABCDEFGHIJKLMN
    Read  Font OCR-A_ExtendedNumeric
    Read  Font OCR-A_Letter2			OPQRSTUVWXYZ<>
    Read  Font OCR-A_Numeric
    Read  Font OCR-A_Alphanumerical1
    Read  Font OCR-A_Alphanumerical2
    Read  Font OCR-A_Symbolo&Number1
    Read  Font OCR-A_Symbolo&Number2
    EnterSP			$>
    Send  $COCEN40000000,G03664242424242424242424242424242424242424242424242420D0D,COCCF46,Ar			$>,>,>,>
    Read  Font OCR-A_Letter1
    Read  Font OCR-A_ExtendedNumeric
    Read  Font OCR-A_Letter2
    Read  Font OCR-A_Numeric
    Read  Font OCR-A_Alphanumerical1			0A1B2C3D4E5F6G7H8I9J0K1L
    Read  Font OCR-A_Alphanumerical2			0K1L2M3N4O5P6Q7R8S=TUV<>
    Read  Font OCR-A_Symbolo&Number1
    Read  Font OCR-A_Symbolo&Number2
Scenario 3: Verify MICR font (62) with all supported charset
    [Documentation]  Check scanner can read OCR-A font , OCR-B font, MICR font with corresponding configuration
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                          Expected result
    EnterSP			$>
    Send  $COCEN20000000,G026645454545454545454545450D0D,COCCF46,Ar			$>,>,>,>
    Read  Font OCR-A_Letter1
    Read  Font OCR-A_ExtendedNumeric			0123456789<
    Read  Font OCR-A_Letter2
    Read  Font OCR-A_Numeric
    Read  Font OCR-A_Alphanumerical1
    Read  Font OCR-A_Alphanumerical2
    Read  Font OCR-A_Symbolo&Number1
    Read  Font OCR-A_Symbolo&Number2
    EnterSP			$>
    Send  			$COCEN10000000,G01664E4E4E4E4E59590D0D,COCCF46,Ar			$>,>,>,>
    Read  Font OCR-A_Letter1
    Read  Font OCR-A_ExtendedNumeric
    Read  Font OCR-A_Letter2
    Read  Font OCR-A_Numeric
    Read  Font OCR-A_Alphanumerical1
    Read  Font OCR-A_Alphanumerical2
    Read  Font OCR-A_Symbolo&Number1			12345<>
    Read  Font OCR-A_Symbolo&Number2			67890<=
    EnterSP			$>
    Send  			$COCEN20000000,G02624E414E414E414E410D0D,COCCF46,Ar			$>,>,>,>
    Read  Font MICR_Letter&Number			ABCD
    Read  Font MICR_Number
    Read  Font MICR_Alphanumerical
    EnterSP			$>
    Send  			$COCEN40000000,G03624E4E4E4E4E4E4E4E4E4E0D0D,COCCF46,Ar			$>,>,>,>
    Read  Font MICR_Letter&Number
    Read  Font MICR_Number			1234567890
    Read  Font MICR_Alphanumerical
    EnterSP			$>
    Send  			$COCEN80000000,G046242424242424242424242424242420D0D,COCCF46,Ar			$>,>,>,>
    Read  Font MICR_Letter&Number
    Read  Font MICR_Number
    Read  Font MICR_Alphanumerical			01A23B45C67D89
Scenario 4: Verify OCR-B font (72) with all supported charset
    [Documentation]  Check scanner can read OCR-A font , OCR-B font, MICR font with corresponding configuration
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                                                   Expected result
    EnterSP			                                                                $>
    Send  $COCEN10000000,G017241414141414141414141414141410D0D,COCCF46,Ar			$>,>,>,>
    Read  Font OCR-B_Letter1			                                            ABCDEFGHIJKLMN
    Read  Font OCR-B_ExtendedNumeric
    Read  Font OCR-B_Letter2			                                            OPQRSTUVWXYZ<A
    Read  Font OCR-B_Alphanumerical1
    Read  Font OCR-B_Alphanumerical2
    Read  Font OCR-B_Symbolo&Number1
    Read  Font OCR-B_Symbolo&Number2
    EnterSP			$>
    Send  $COCEN20000000,G02724242424242424242424242424242424242424242424242420D0D,COCCF46,Ar			$>,>,>,>
    Read  Font OCR-B_Letter1
    Read  Font OCR-B_ExtendedNumeric
    Read  Font OCR-B_Letter2
    Read  Font OCR-B_Alphanumerical1			0A1B2C3D4E5F6G7H8I9J0K1L
    Read  Font OCR-B_Alphanumerical2			0K1L2M3N4O5P6Q7R8S9TUV<<
    Read  Font OCR-B_Symbolo&Number1
    Read  Font OCR-B_Symbolo&Number2
    EnterSP			$>
    Send  $COCEN40000000,G037245454545454545454545450D0D,COCCF46,Ar			$>,>,>,>
    Read  Font OCR-B_Letter1
    Read  Font OCR-B_ExtendedNumeric			0123456789<
    Read  Font OCR-B_Letter2
    Read  Font OCR-B_Alphanumerical1
    Read  Font OCR-B_Alphanumerical2
    Read  Font OCR-B_Symbolo&Number1
    Read  Font OCR-B_Symbolo&Number2
