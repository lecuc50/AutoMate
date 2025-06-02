*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
*** Variables ***
${current_directory}         ${data_source}\\Quick_Test

*** test cases ***
ATQ_Decoding_1DsymsEnable_Setup
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    EnterSP					                                $>
    Send  $CADOT1E					                        $>
    Send  $CIDCO01					                        $>
    Send  $CABEN01					                        $>
    Send  $CEBEN01					                        $>
    Send  $C8BEN01					                        $>
    Send  $C3BEN01					                        $>
    Send  $C3BIN01					                        $>
    Send  $C3BIS01					                        $>
    Send  $C4BEN01					                        $>
    Send  $CLBEN01					                        $>
    Send  $CXBEN01					                        $>
    Send  $CC3EN01					                        $>
    Send  $CCCEN01					                        $>
    Send  $CC3CT01					                        $>
    Send  $CC3FA01					                        $>
    Send  $CCTEN01					                        $>
    Send  $CI8CE01					                        $>
    Send  $CI8L00102					                    $>
    Send  $CC9EN01					                        $>
    Send  $CC8EN01					                        $>
    Send  $CU8EN01					                        $>
    Send  $CI2EN01					                        $>
    Send  $CU2EN01					                        $>
    Send  $CS2EN01					                        $>
    Send  $CIAEN01					                        $>
    Send  $CF2EN01					                        $>
    Send  $CM2EN01					                        $>
    Send  $CCHEN01					                        $>
    Send  $CPLEN01					                        $>
    Send  $CMSEN01					                        $>
    Send  $CCBEN01					                        $>
    Send  $CCBAB01					                        $>
    Send  $CC1EN01					                        $>
    Send  $CP3EN01					                        $>
    Send  $C4B2D01					                        $>
    Send  $CLB2D01					                        $>
    Send  $CXB2D01					                        $>
    Send  $CU82D01					                        $>
    Send  $CEB2D01					                        $>
    Send  $CAB2D01					                        $>
    Send  $C8B2D01					                        $>
    Send  $C3B2D01					                        $>
    Send  $CADO201					                        $>
    Send  $CADO501					                        $>
    Send  $CCPCL00					                        $>
    Send  $Ar					                            $>
ATQ_Decoding_1DsymsEnable_UPCA
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  UPCA_123456789012					                A123456789012
    Read  UPCA_AddOn2_12345678901212					    A12345678901212
    Read  UPCA_AddOn5_12345678901212345					    A12345678901212345
    Read  UPCA_Coupon_523456789010					        A523456789010
ATQ_Decoding_1DsymsEnable_UPCE
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  UPCE_02345673					                    E02345673
    Read  UPCE_AddOn2_0234567389					        E0234567389
    Read  UPCE_AddOn5_0234567389759					        E0234567389759
ATQ_Decoding_1DsymsEnable_EAN8
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  EAN8_12345670					                    FF12345670
    Read  EAN8_AddOn2_1234567012					        FF1234567012
    Read  EAN8_AddOn5_1234567012345					        FF1234567012345
ATQ_Decoding_1DsymsEnable_EAN13
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  EAN13_1234567890128					            F1234567890128
    Read  EAN13_AddOn2_123456789012812					    F123456789012812
    Read  EAN13_AddOn5_123456789012812345					F123456789012812345
    Read  ISBN13_9781234567897					            I123456789X
    Read  ISBN13_9794567890129					            I4567890124
    Read  ISBN13_AddOn5_978817525766512345					I817525766012345
    Read  ISSN_9770264359008					            n02643596
    Read  ISSN_AddOn2_977123456789812					    n1234567912
ATQ_Decoding_1DsymsEnable_Code39
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  Code39_SW7472					                    *SW7472
    Read  Code39_FullASCII_A12@k)					        *A12@k)
    Read  Code39CIP_1234562					                Y1234562
    Read  Code39TriOptic_456123					            $T456123
ATQ_Decoding_1DsymsEnable_GS1DataBar
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  GS1DataBar14_0112345678901231					    R40112345678901231
    Read  GS1DataBarTruncated_0112345678901231					            R40112345678901231
    Read  GS1DataBarStacked_0112345678901231					            R40112345678901231
    Read  GS1DataBarStackedOmnidirectional_0112345678901231					R40112345678901231
    Read  GS1DataBarLimited_0112345678901231					            RL0112345678901231
    Read  GS1DataBarExpanded_010123456789012313					            RX0123456789012313
    Read  GS1DataBarExpandedStacked_010123456789012313					    RX0123456789012313
ATQ_Decoding_1DsymsEnable_Code128
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  Code128_SEGH#%SG23h					                            |#SEGH#%SG23h
    Read  EANUCC128_SEGH#%SG23f					                            ]C1SEGH#%SG23f
    Read  ISBT128					                                        |#f=ADonaID1234=%BloodCD12
ATQ_Decoding_1DsymsEnable_Code93
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  Code93					                                        &HY$AB C/+71
    Read  Code93FullASCII					                                &!%JVS)*14k
ATQ_Decoding_1DsymsEnable_Code11
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  Code11_CK2_1240					                CE1240
ATQ_Decoding_1DsymsEnable_Code32
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  Code32_34567890					                A34567890
ATQ_Decoding_1DsymsEnable_MSI
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  MSI_453621					                    @453621
    Read  MSI_CK1_4536215					                @4536215
    Read  MSI_CK2_45362159					                @45362159
ATQ_Decoding_1DsymsEnable_Codabar
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  Codabar_C23049$B					                %c23049$b
    Read  QT_ABCCodabar(2Labels)					        Sc12344333c
ATQ_Decoding_1DsymsEnable_Code2of5
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  Code2of5Interleaved_123457					    i123457
    Read  Code2of5Industrial_12345678					    s12345678
    Read  Discrete2of5_34564678					            s34564678
    Read  Code2of5IATA_123412345678903					    IA123412345678903
    Read  Follett2of5_T0123456					            OT 0123456
    Read  Code2of5Matrix_08312865					        g08312865
    Read  QT_Interleaved2of5CIPHR   					    e9876544
    Read  Code2of5IATA_0986275650					        W0986275650
ATQ_Decoding_1DsymsEnable_Plessey
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  PlesseyBidirectional_123456E000					a123456E000
ATQ_Decoding_1DsymsEnable_Composite
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  GS1DataBar14_Composite_011234567890123112345678901231234567890123					        R4011234567890123112345678901231234567890123
    Read  GS1DataBarTruncated_Composite_011234567890123112345678901231234567890123					R4011234567890123112345678901231234567890123
    Read  GS1DataBarStacked_Composite_011234567890123112345678901231234567890123					R4011234567890123112345678901231234567890123
    Read  GS1DataBarStackedOmnidirectional_Composite_011234567890123112345678901231234567890123					R4011234567890123112345678901231234567890123
    Read  GS1DataBarLimited_Composite_011234567890123112345678901231234567890123					RL011234567890123112345678901231234567890123
    Read  GS1DataBarExpanded_Composite					    RX01012345678901282142349283472987423
    Read  GS1DataBarExpandedStacked_Composite				RX01209201190123\\x1d19789456
    Read  EAN128_CCA1					                    ]C1012092011901233789456
    Read  EAN8_Composite_07894565789456					    FF07894565 OR/ FF07894565789456
    Read  EAN13_Composite_123456789012812345678901231234567890123					F1234567890128 OR/ F123456789012812345678901231234567890123
    Read  UPCA_Composite_12345678901212345678901231234567890123					    A123456789012 OR/ A12345678901212345678901231234567890123
    Read  UPCE_Composite_01234565HelloABCC-Acompo					                E01234565 OR/ E01234565HelloAB CC-A compo
    Read  EAN128_CCA2					                                            ]C1012092011901233abcde
ATQ_Decoding_2DsymsDefault
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  PDF417					                                                PBP&#*09k2h4
    Read  MicroPDF417                                                               ${EMPTY}
    Read  MacroPDF417_ABCabc					                                    PABCabc
    Read  Aztec_Akd3^%$3NOLd                                                        AzAkd3^%$3NOLd
    Read  DataMatrix_#%Js@%mkASFJ37h3f9JsKS					                        Dm#%Js@%mkASFJ37h3f9JsKS
    Read  QT_ChineseVer1                                                          ${EMPTY}
    Read  QT_ChineseVer4                                                          ${EMPTY}
    Read  QT_ChineseVer24                                                         ${EMPTY}
    Read  Maxicode_ABCabc                                                           ${EMPTY}
    Read  QRCode_@#JasfkBSK14umjkfJHAn12478nasf					                    QR@#JasfkBSK14umjkfJHAn12478nasf
    Read  MicroQRCode_ABCabc                                                        ${EMPTY}
