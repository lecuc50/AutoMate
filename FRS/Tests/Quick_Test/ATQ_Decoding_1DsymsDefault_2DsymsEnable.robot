*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
*** Variables ***
${current_directory}         ${data_source}\\Quick_Test

*** test cases ***
ATQ_Decoding_1DsymsDefault_UPCA
    [Documentation]  Verify that SUT can decodes UPCA
    [Tags]      RS232_STD    USB_COM   USB_CPS  USB_KBD  USB_KBD_ALT
    # Description                                               Expected result
    Read   $P,CIDCO01,P
    Read   UPCA_123456789012	                                A123456789012
    Read   UPCA_AddOn2_12345678901212	                        A123456789012
    Read   UPCA_AddOn5_12345678901212345	                    A123456789012
    Read   UPCA_Coupon_523456789010	                            A523456789010
ATQ_Decoding_1DsymsDefault_UPCE
    [Documentation]  Verify that SUT can decodes UPCE
    [Tags]      RS232_STD    USB_COM   USB_CPS  USB_KBD  USB_KBD_ALT
    Read   $P,CIDCO01,P
    Read   UPCE_02345673	                                    E02345673
    Read   UPCE_AddOn2_0234567389	                            E02345673
    Read   UPCE_AddOn5_0234567389759	                        E02345673
ATQ_Decoding_1DsymsDefault_EAN8
    [Documentation]  Verify that SUT can decodes EAN8
    [Tags]      RS232_STD    USB_COM   USB_CPS  USB_KBD  USB_KBD_ALT
    Read   $P,CIDCO01,P
    Read   EAN8_12345670	                                    FF12345670
    Read   EAN8_AddOn2_1234567012	                            FF12345670
    Read   EAN8_AddOn5_1234567012345	                        FF12345670
ATQ_Decoding_1DsymsDefault_EAN13
    [Documentation]  Verify that SUT can decodes EAN13
    [Tags]      RS232_STD    USB_COM   USB_CPS  USB_KBD  USB_KBD_ALT
    Read   $P,CIDCO01,P
    Read   EAN13_1234567890128	                                F1234567890128
    Read   EAN13_AddOn2_123456789012812	                        F1234567890128
    Read   EAN13_AddOn5_123456789012812345	                    F1234567890128
    Read   ISBN13_9781234567897	                                F9781234567897
    Read   ISBN13_9794567890129	                                F9794567890129
    Read   ISBN13_AddOn5_978817525766512345	                    F9788175257665
    Read   ISSN_9770264359008	                                F9770264359008
    Read   ISSN_AddOn2_977123456789812	                        F9771234567898
ATQ_Decoding_1DsymsDefault_Code39
    [Documentation]  Verify that SUT can decodes Code39
    [Tags]      RS232_STD    USB_COM   USB_CPS  USB_KBD  USB_KBD_ALT
    Read   $P,CIDCO01,P
    Read   Code39_SW7472	                                    *SW7472
    Read   Code39_FullASCII_A12@k)	                            *A12%V+K/I
    Read   Code39CIP(FrenchPharmacode39)	                    *1234562
    Read   Code39TriOptic_456123                                ${EMPTY}
ATQ_Decoding_1DsymsDefault_Code128
    [Documentation]  Verify that SUT can decodes Code128
    [Tags]      RS232_STD    USB_COM   USB_CPS  USB_KBD  USB_KBD_ALT
    Read   $P,CIDCO01,P
    Read   Code128_SEGH#%SG23h	                                |#SEGH#%SG23h
    Read   EANUCC128_SEGH#%SG23f	                            ]C1SEGH#%SG23f
    Read   ISBT128	                                            f=ADonaID1234 OR/ f=%BloodCD12 OR/ #f=ADonaID1234=%BloodCD12
ATQ_Decoding_1DsymsDefault_Code32
    [Documentation]  Verify that SUT can decodes Code32
    [Tags]      RS232_STD    USB_COM   USB_CPS  USB_KBD  USB_KBD_ALT
    Read   $P,CIDCO01,P
    Read   Code32_34567890	                                    *B9P91Q
ATQ_Decoding_1DsymsDefault_GS1DataBar
    [Documentation]  Verify that SUT can't decodes disable default symbologies: GS1DataBar
    [Tags]      RS232_STD    USB_COM   USB_CPS  USB_KBD  USB_KBD_ALT
    Read   $P,CIDCO01,P
    Read   GS1DataBar14_0112345678901231                        ${EMPTY}
    Read   GS1DataBarTruncated_0112345678901231                 ${EMPTY}
    Read   GS1DataBarStacked_0112345678901231                   ${EMPTY}
    Read   GS1DataBarStackedOmnidirectional_0112345678901231        ${EMPTY}
    Read   GS1DataBarLimited_0112345678901231                   ${EMPTY}
    Read   GS1DataBarExpanded_010123456789012313                ${EMPTY}
    Read   GS1DataBarExpandedStacked_010123456789012313         ${EMPTY}

ATQ_Decoding_1DsymsDefault_Code93
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS  USB_KBD  USB_KBD_ALT
    Read   $P,CIDCO01,P
    Read   Code93                                               ${EMPTY}
    Read   Code93FullASCII                                      ${EMPTY}
ATQ_Decoding_1DsymsDefault_Code11
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS  USB_KBD  USB_KBD_ALT
    Read   $P,CIDCO01,P
    Read   Code11_CK2_1240                                      ${EMPTY}

ATQ_Decoding_1DsymsDefault_MSI
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS  USB_KBD  USB_KBD_ALT
    Read   $P,CIDCO01,P
    Read   MSI_453621                                           ${EMPTY}
    Read   MSI_CK1_4536215                                      ${EMPTY}
    Read   MSI_CK2_45362159                                     ${EMPTY}
ATQ_Decoding_1DsymsDefault_Codabar
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS  USB_KBD  USB_KBD_ALT
    Read   $P,CIDCO01,P
    Read   Codabar_C23049$B                                     ${EMPTY}
    Read   QT_ABCCodabar(2Labels)                               ${EMPTY}
ATQ_Decoding_1DsymsDefault_Coda2of5
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS  USB_KBD  USB_KBD_ALT
    Read   $P,CIDCO01,P
    Read   Code2of5Interleaved_123457                           ${EMPTY}
    Read   Discrete2of5_34564678                                ${EMPTY}
    Read   Code2of5IATA_0986275650                              ${EMPTY}
    Read   Follett2of5_T0123456                                 ${EMPTY}
    Read   Code2of5Matrix_08312865                              ${EMPTY}
    Read   QT_Interleaved2of5CIPHR                              ${EMPTY}
    Read   Code2of5Datalogic_123456                             ${EMPTY}
    Read   Code2of5Industrial_12345678                          ${EMPTY}
ATQ_Decoding_1DsymsDefault_Plessey
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS  USB_KBD  USB_KBD_ALT
    Read   $P,CIDCO01,P
    Read   PlesseyBidirectional_123456E000                      ${EMPTY}
ATQ_Decoding_1DsymsDefault_Composite
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS  USB_KBD  USB_KBD_ALT
    Read   $P,CIDCO01,P
    Read   GS1DataBar14_Composite_011234567890123112345678901231234567890123                            ${EMPTY}
    Read   GS1DataBarTruncated_Composite_011234567890123112345678901231234567890123                     ${EMPTY}
    Read   GS1DataBarStackedOmnidirectional_Composite_011234567890123112345678901231234567890123        ${EMPTY}
    Read   GS1DataBarLimited_Composite_011234567890123112345678901231234567890123                       ${EMPTY}
    Read   GS1DataBarExpanded_Composite                                     ${EMPTY}
    Read   GS1DataBarExpandedStacked_Composite	                            ]C1012092011901233
    Read   EAN8_Composite_07894565789456	                                FF07894565
    Read   EAN13_Composite_123456789012812345678901231234567890123	        F1234567890128
    Read   UPCA_Composite_12345678901212345678901231234567890123	        A123456789012
    Read   UPCE_Composite_01234565HelloABCC-Acompo	                        E01234565
    Read   EAN128_CCA1	                                                    ]C1012092011901233
ATQ_Decoding_1DsymsDefault_Telepen
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS  USB_KBD  USB_KBD_ALT
    Read   $P,CIDCO01,P
    Read   QT_Telepen                                                       ${EMPTY}
ATQ_Decoding_2DsymsEnable
    [Documentation]  Verify that SUT can decodes 2D Symbologies when enable them
    [Tags]      RS232_STD    USB_COM   USB_CPS
    EnterSP	                                                    $>
    Send   $CIDCO01	                                            $>
    Send   $CAZEN01	                                            $>
    Send   $CDMEN01	                                            $>
    Send   $CQREN01	                                            $>
    Send   $CMQEN01	                                            $>
    Send   $CMXEN01	                                            $>
    Send   $CP4EN01	                                            $>
    Send   $CMIEN01	                                            $>
    Send   $CDESA01	                                            $>
    Send   $CCSEN01	                                            $>
    Send   $Ar	                                                $>
    Read   $P,CIDCO01,CAZEN01,CDMEN01,CQREN01,CMQEN01,CMXEN01,CP4EN01,CMIEN01,CDESA01,CCSEN01,P
    Read   PDF417	                                            PBP&#*09k2h4
    Read   MicroPDF417	                                        mP09*$%)djkl
    Read   MacroPDF417_ABCabc	                                PABCabc
    Read   Aztec_Akd3^%$3NOLd	                                AzAkd3^%$3NOLd
    Read   DataMatrix_#%Js@%mkASFJ37h3f9JsKS	                Dm#%Js@%mkASFJ37h3f9JsKS
    Read   QT_ChineseVer1                                       $S\\xba\\xba\\xd0\\xc5\\xc2\\xeb\\xb1\\xea\\xd7\\xbc
    Read   QT_ChineseVer4                                       $S\\xba\\xba\\xd0\\xc5\\xc2\\xeb\\xb1\\xea\\xd7\\xbc\r\\xd6\\xd0\\xb9\\xfa\\xce\\xef\\xc6\\xb7\\xb1\\xe0\\xc2\\xeb\\xd6\\xd0\\xd0\\xc4
    Read   QT_ChineseVer24                                      $S\\xba\\xba\\xd0\\xc5\\xc2\\xeb\\xb1\\xea\\xd7\\xbc\\xd6\\xd0\\xba\\xa2\\xb3\\xce\\xd2\\xaa\\xb9\\xa2\\xcb\\xe6\\xd1\\xad\\xca\\xd6\\xb0\\xed\\xd6\\xee\\xb9\\xd7\\xbb\\xd9\\xcc\\xbe\\xc3\\xe0\\xb1\\xb7\\xd7\\xdc\\xb5\\xf3\\xbb\\xae\\xce\\xef\\xc6\\xb7\\xb1\\xe0\\xc2\\xeb\\xd6\\xd0\\xd0\\xc4\\xb1\\xb0\\xbb\\xd3\\xbe\\xbc\\xb9\\xd2\\xa8\\xb3\\xbf\\xa3\\xd1\\xd6\\xb8\\xb0\\xc4\\xea\\xc1\\xf8\\xb8\\xa3\\xb9\\xdd\\xc8\\xe6\\xca\\xb8\\xb8\\xaf\\xb9\\xdb\\xb4\\xf7\\xbe\\xa9\\xcd\\xf8\\xc2\\xb7\\xb3\\xa9\\xcf\\xeb\\xbf\\xc6\\xbc\\xbc\\xb7\\xa2\\xd5\\xb9\\xd3\\xd0\\xd0\\xb0\\xc1\\xbb\\xa3\\xd6\\xb6\\xc7\\xd7\\xab\\xa3\\xb7\\xc3\\xa7\\xca\\xc8\\xb1\\xd9\\xc8\\xef\\xb3\\xdb\\xcf\\xee\\xbc\\xfd\\xbe\\xd1\\xa8\\xb0\\xc9\\xf9\\xd2\\xc4\\xb9\\xab\\xcb\\xbe\\xd5\\xc5\\xb3\\xc9\\xba\\xa3\\xa1\\xa2\\xd3\\xee\\xbd\\xbf\\xc1\\xd4\\xcc\\xcd\\xbe\\xa8\\xc1\\xe4\\xc7\\xdb\\xb7\\xb2\\xcc\\xba\\xb7\\xaf\\xbf\\xb0\\xd5\\xf5\\xb2\\xc9\\xb0\\xa4\\xd2\\xa7\\xb7\\xae\\xb2\\xae\\xe9\\xaa\\xa1\\xa2\\xbb\\xc6\\xd1\\xe0\\xb1\\xf5\\xa1\\xa2\\xc2\\xde\\xc8\\xbf\\xd0\\xd4\\xb7\\xcc\\xb5\\xb0\\xb3\\xf2\\xd0\\xa8\\xb6\\xa7\\xd4\\xf7\\xcb\\xc9\\xc8\\xd7\\xc5\\xc2\\xd6\\xe1\\xa8\\xb6\r
    Read   Maxicode_#%ake3f9JsLHAN                              MC#%ake3f9JsLHAN
    Read   QRCode_@#JasfkBSK14umjkfJHAn12478nasf	            QR@#JasfkBSK14umjkfJHAn12478nasf
    Read   MicroQRCode_08aSFJk@%$kAK	                        $Q08aSFJk@%$kAK
ATQ_Decoding_2DsymsEnable_USB_KBD
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      USB_KBD  USB_KBD_ALT
    Read   $P,CIDCO01,CAZEN01,CDMEN01,CQREN01,CMQEN01,CMXEN01,CP4EN01,CMIEN01,CDESA01,CCSEN01,P
    Read   PDF417	                                            PBP&#*09k2h4
    Read   MicroPDF417	                                        mP09*$%)djkl
    Read   MacroPDF417_ABCabc	                                PABCabc
    Read   Aztec_Akd3^%$3NOLd	                                AzAkd3^%$3NOLd
    Read   DataMatrix_#%Js@%mkASFJ37h3f9JsKS	                Dm#%Js@%mkASFJ37h3f9JsKS
    Read   QT_ChineseVer1                                       $S\\xba\\xba\\xd0\\xc5\\xc2\\xeb\\xb1\\xea\\xd7\\xbc
    Read   QT_ChineseVer4                                       $S\\xba\\xba\\xd0\\xc5\\xc2\\xeb\\xb1\\xea\\xd7\\xbc\\r\\n\\xd6\\xd0\\xb9\\xfa\\xce\\xef\\xc6\\xb7\\xb1\\xe0\\xc2\\xeb\\xd6\\xd0\\xd0\\xc4
    Read   QT_ChineseVer24                                      $S\\xba\\xba\\xd0\\xc5\\xc2\\xeb\\xb1\\xea\\xd7\\xbc\\xd6\\xd0\\xba\\xa2\\xb3\\xce\\xd2\\xaa\\xb9\\xa2\\xcb\\xe6\\xd1\\xad\\xca\\xd6\\xb0\\xed\\xd6\\xee\\xb9\\xd7\\xbb\\xd9\\xcc\\xbe\\xc3\\xe0\\xb1\\xb7\\xd7\\xdc\\xb5\\xf3\\xbb\\xae\\xce\\xef\\xc6\\xb7\\xb1\\xe0\\xc2\\xeb\\xd6\\xd0\\xd0\\xc4\\xb1\\xb0\\xbb\\xd3\\xbe\\xbc\\xb9\\xd2\\xa8\\xb3\\xbf\\xa3\\xd1\\xd6\\xb8\\xb0\\xc4\\xea\\xc1\\xf8\\xb8\\xa3\\xb9\\xdd\\xc8\\xe6\\xca\\xb8\\xb8\\xaf\\xb9\\xdb\\xb4\\xf7\\xbe\\xa9\\xcd\\xf8\\xc2\\xb7\\xb3\\xa9\\xcf\\xeb\\xbf\\xc6\\xbc\\xbc\\xb7\\xa2\\xd5\\xb9\\xd3\\xd0\\xd0\\xb0\\xc1\\xbb\\xa3\\xd6\\xb6\\xc7\\xd7\\xab\\xa3\\xb7\\xc3\\xa7\\xca\\xc8\\xb1\\xd9\\xc8\\xef\\xb3\\xdb\\xcf\\xee\\xbc\\xfd\\xbe\\xd1\\xa8\\xb0\\xc9\\xf9\\xd2\\xc4\\xb9\\xab\\xcb\\xbe\\xd5\\xc5\\xb3\\xc9\\xba\\xa3\\xa1\\xa2\\xd3\\xee\\xbd\\xbf\\xc1\\xd4\\xcc\\xcd\\xbe\\xa8\\xc1\\xe4\\xc7\\xdb\\xb7\\xb2\\xcc\\xba\\xb7\\xaf\\xbf\\xb0\\xd5\\xf5\\xb2\\xc9\\xb0\\xa4\\xd2\\xa7\\xb7\\xae\\xb2\\xae\\xe9\\xaa\\xa1\\xa2\\xbb\\xc6\\xd1\\xe0\\xb1\\xf5\\xa1\\xa2\\xc2\\xde\\xc8\\xbf\\xd0\\xd4\\xb7\\xcc\\xb5\\xb0\\xb3\\xf2\\xd0\\xa8\\xb6\\xa7\\xd4\\xf7\\xcb\\xc9\\xc8\\xd7\\xc5\\xc2\\xd6\\xe1\\xa8\\xb6\r
    Read   Maxicode_#%ake3f9JsLHAN                              MC#%ake3f9JsLHAN
    Read   QRCode_@#JasfkBSK14umjkfJHAn12478nasf	            QR@#JasfkBSK14umjkfJHAn12478nasf
    Read   MicroQRCode_08aSFJk@%$kAK	                        $Q08aSFJk@%$kAK

