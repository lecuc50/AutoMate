*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}


*** Variables ***
${current_directory}         ${data_source}\\Quick_Test
*** test cases ***
Scenario 1: Multiline with OCR-A font with 2 lines
    [Documentation]  Check ability of scanner can read OCR multiline
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                                           Expected result
    Send  $S,COCEN10000000,G01664E4E4E4E6E42424242204242420D0D,Ar	        $>,>,>,>
    Read  Font OCR-A_1234AB3D FG9	                                        1234\r\nAB3D FG9
    Read  Font OCR-A_5678ARIT O1L	                                        5678\r\nARIT O1L
    Read  Font OCR-A_0124RESX 5X0	                                        0124\r\nRESX 5XO
Scenario 1: Multiline with OCR-A font with 3 lines
    [Documentation]  Check ability of scanner can read OCR multiline
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                                           Expected result
    Send  $S,COCEN20000000,G0266424242426E454545456E414141410D0D,Ar	        $>,>,>,>
    Read  Font OCR-A_MO1I1234ABCD	                                        M01I\r\n1234\r\nABCD
    Read  Font OCR-A_1A2T014EFGH	                                        1A2T\r\n<014\r\nEFGH
    Read  Font OCR-A_G056316IJKL	                                        GO56\r\n316<\r\nIJKL
    Read  Font OCR-A_AB978FG	                                            A>8=\r\n9<78\r\nF>G<
Scenario 2: Multiline with OCR-B font 2 lines
    [Documentation]  Check ability of scanner can read OCR multiline
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                                           Expected result
    Send  $S,COCEN10000000,G01724E4E4E4E6E42424242204242420D0D,Ar	        $>,>,>,>
    Read  Font OCR-B_1234AB3DFG9	                                        1234\r\nAB3D FG9
    Read  Font OCR-B_5678ARIT 01L	                                        5678\r\nARIT O1L
    Read  Font OCR-B_0124RESX 5X0	                                        0124\r\nRESX 5XO
Scenario 2: Multiline with OCR-B font 3 lines
    [Documentation]  Check ability of scanner can read OCR multiline
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                                           Expected result
    Send  $S,COCEN20000000,G0272424242426E454545456E414141410D0D,Ar	        $>,>,>,>
    Read  Font OCR-B_M01I1234ABCD	                                        M01I\r\n1234\r\nABCD
    Read  Font OCR-B_1A2T014EFGH	                                        1A2T\r\n<014\r\nEFGH
    Read  Font OCR-B_G056316IJKL	                                        GO56\r\n316<\r\nIJKL
Scenario 3: Multiline with MICR font 2 lines
    [Documentation]  Check ability of scanner can read OCR multiline
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                                           Expected result
    Send  $S,COCEN80000000,G04624242426E4E4E204E414E4E4E0D0D,Ar	            $>,>,>,>
    Read  Font MICR_123456789	                                            123\r\n45 6B789
    Read  Font MICR_1C378 9A045	                                            1C3\r\n78 9A045
Scenario 3: Multiline with MICR font 3 lines
    [Documentation]  Check ability of scanner can read OCR multiline
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                                           Expected result
    Send  $S,COCEN80000000,G046242424142426E4E4E414E4E6E4E4E414E4E0D0D,Ar	    $>,>,>,>
    Read  Font MICR_12A3456B7890C12	                                        12A34\r\n56B78\r\n90C12
    Read  Font MICR_98D7654C3210B98	                                        98D76\r\n54C32\r\n10B98
