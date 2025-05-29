*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}


*** Variables ***
${current_directory}         ${data_source}\\Quick_Test
*** test cases ***
Scenario 1: Without both Weight String and Modulo String, check digit field into structure
    [Documentation]  Check calculated check character with exists Weight String or Modulo string
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                                           Expected result
    Send  $S,COCEN10000000,G014E424E424E4E630D0D,Ar	                        $>,>,>,>
    Read  OCR-B_1A2B190	                                                    1A2B190
    Read  OCR-B_1A2B196
Case 2: MICR font with 2 check characters at the midle position (63)
    [Documentation]  Check calculated check character with exists Weight String or Modulo string
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                                           Expected result
    EnterSP	$>
    Send  $S,COCEN10000000,G01624E4E4E4E4E20634E4E4E4E4E630D0D,Ar	        $>,>,>,>
    Read  MICR_199370 883650	                                            19937 0883650
    Read  MICR_13209 0922220	                                            13209 0922220
    Read  MICR_51011 0594940	                                            51011 0594940
    Read  MICR_19937  2883652
    Read  MICR_13209 4922224
    Read  MICR_51011 9594949
Scenario 2: Check Customer Structure OCR have Weight String , without Modulo String, no check digit field into structure
    [Documentation]  Check calculated check character with exists Weight String or Modulo string
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                                           Expected result
    Send  $S,COCEN20000000,G026641414141415942424242420D313233340D0D,Ar	     $>,>,>,>
    Read  OCR-A_LVUQQV9J9Q	                                                    LVUQQ=V9J9Q
    Read  Font OCR-A_LIFMLKJB70	                                                LIFML<KJB70
    Read  Font OCR-A_XMIHV=ELWIK	                                            XMIHV=ELWIK
Scenario 3: Check Customer Structure OCR have Weight String , without Modulo String, check digit field into structure
    [Documentation]  Case 1:  length of Weight String = length of <FIELD>, 1 check characters at the end
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                                           Expected result
    Send  $S,COCEN20000000,G02724242424242594E4E4E4E4E630D31323334353637383941420D0D,Ar	                $>,>,>,>
    Read  Font OCR-B_59Y54985040	                                        59Y54<985040
    Read  Font OCR-B_WUXRP226970	                                        WUXRP<226970
    Read  Font OCR-B_WUXRP226971
Scenario 3: Case 2: length of Weight String = length of <FIELD>, 2 check characters: 1 at the midle position and 1 at the end posititon
    [Documentation]  Case 1:  length of Weight String = length of <FIELD>, 1 check characters at the end
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                                           Expected result
    Send  $S,COCEN40000000,G03414141414163204E4E4E4E4E630D7A797877767574737271706F6D0D0D,Ar	            $>,>,>,>
    Read  Font OCR-B_RSKBA0147260	                                        RSKBA0 147260
    Read  Font OCR-B_MKPQA0536420	                                        MKPQA0 536420
    Read  Font OCR-B_LASRL0955030	                                        LASRL0 955030
    Read  Font OCR-B_LASRL1955030
Scenario 4: Check Customer Structure OCR have Weight String and Modulo String, no check digit field into structure
    [Documentation]  There is not check character in label. If calculated check digit of this label is equal 0 then scanner can read it.
    ...   If calculate check digit different from 0, scanner can not read it.
    ...  Case 1: length of weight String = length of <FIELD>, start/stop removal
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                                           Expected result
    Send  $S,COCEN80000000,G04724E4E4E4E4E53206F41414141410D31323334353637383941420D390D0D,Ar	        $>,>,>,>
    Read  Font OCR-B_73969WZLBV
    Read  Font OCR-B_73964WZLBV	                                            73964WZLBV
Scenario 5: Check Customer Structure OCR have Weight String and Modulo String, check digit field into structure
    [Documentation]  Case 1: length of weight String = length of <FIELD>, 1 check character at the end position
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                                           Expected result
    Send  $S,COCEN40000000,G03724545454545414141414159630D303234363841434547494B0D350D0D,Ar	            $>,>,>,>
    Read  Font OCR-B_920Z0YJM3	                                            <9<20ZOYJM<3
    Read  Font OCR-B_920Z0YJM8
    Read  Font OCR-B_16410GPIPJ	                                            16410GPIPJ<3
    Read  Font OCR-B_16410GPIPJ5
    Read  Font OCR-B_8184QLWIB2	                                            8184<QLWIB<2
    Read  Font OCR-B_8184QLWIB1
Scenario 5: Case 2: length of weight String < length of <FIELD>, 1 check character at the end position
    [Documentation]  Case 2: length of weight String < length of <FIELD>, 1 check character at the end position
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                                           Expected result
    Send  $S,COCEN10000000,G014242424242594141414141630D464B50555A650D390D0D,Ar	                            $>,>,>,>
    Read  Font OCR-B_EHG6DUKRYE7	                                        EHG6D<UKRYE7
    Read  Font OCR-B_EHG6DUKRYE1
Scenario 5: Case 4: length of weight String < length of <FIELD>, 3 check characters at the end position
    [Documentation]  Case 4: length of weight String < length of <FIELD>, 3 check characters at the end position
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                                           Expected result
    Send  $S,COCEN10000000,G0142424242425941414141416363630D464B50555A650D3939390D0D,Ar	                $>,>,>,>
    Read  Font OCR-B_EHG6DUKRYE664	                                        EHG6D<UKRYE664
    Read  Font OCR-B_0U71BHMFJX029	                                        0U71B<HMFJX029
    Read  Font OCR-B_N09ANXZEMY115	                                        N09AN<XZEMY115
    Read  Font OCR-B_N09ANXZEMY151
Scenario 5: Case 5: length of weight String = length of <FIELD>, 2 check character at the midle and the end + start/stop removal
    [Documentation]  Case 5: length of weight String = length of <FIELD>, 2 check character at the midle and the end + start/stop removal
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                                           Expected result
    Send  $S,COCEN20000000,G024E4E4E4E4E53636F414141414153636F0D313233343536373839410D31300D0D,Ar	        $>,>,>,>
    Read  Font OCR-B_692520YKTZY1	                                        69252YKTZY
    Read  Font OCR-B_987368QBUDQ0	                                        98736QBUDQ
    Read  Font OCR-B_071349TZVSC9	                                        07134TZVSC
