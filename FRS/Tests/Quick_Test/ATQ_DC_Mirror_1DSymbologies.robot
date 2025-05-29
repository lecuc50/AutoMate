*** settings ***
Documentation  See [http://www.robotframework.org]|robot framework website]
...            JAZZ ID: 47070  Aztec Minimum Variable Label Length Proofing Control
...            Content: When a Aztec is presented to the software with variable length decoding enabled,
...               the software shall decode the label if the length meets or exceeds the minimum length
...               specified by the configuration and all other Aztec label proofing requirements are met.
Test Tags      PGS_C  Miki_C  LEO_C  Corded   Cordless
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Library     OperatingSystem
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
*** Variables ***
${current_directory}         ${data_source}\\QuickTest

*** test cases ***
Senario 1: Disable Mirror_Setup
    [Documentation]  Setup to enable all 1D Symblelogies and disable Mirror: ARAM00
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
    Send  $CARMR00                                          $>
    Send  $Ar					                            $>
Senario 2: Disable Mirror_UPCA
    [Documentation]  Default the HH can read 1D Mirror and Normal
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  UPCA_123456789012					                A123456789012
    Read  UPCA_AddOn2_12345678901212					    A12345678901212
    Read  UPCA_AddOn5_12345678901212345					    A12345678901212345
    Read  UPCA_Coupon_523456789010					        A523456789010
    Read  Mirror_Vertical_UPCA_123456789012					                A123456789012
    Read  Mirror_Vertical_UPCA_AddOn2_12345678901212					    A12345678901212
    Read  Mirror_Vertical_UPCA_AddOn5_12345678901212345					    A12345678901212345
    Read  Mirror_Vertical_UPCA_Coupon_523456789010					        A523456789010
    Read  Mirror_Horizontal_UPCA_123456789012					                A123456789012
    Read  Mirror_Horizontal_UPCA_AddOn2_12345678901212					    A12345678901212
    Read  Mirror_Horizontal_UPCA_AddOn5_12345678901212345					    A12345678901212345
    Read  Mirror_Horizontal_UPCA_Coupon_523456789010					        A523456789010
Senario 3: Disable Mirror_UPCE
    [Documentation]  Default the HH can read 1D Mirror and Normal
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                                           Expected result
    Read  UPCE_02345673					                                    E02345673
    Read  UPCE_AddOn2_0234567389					                        E0234567389
    Read  UPCE_AddOn5_0234567389759					                        E0234567389759
    Read  Mirror_Horizontal_UPCE_02345673					                E02345673
    Read  Mirror_Horizontal_UPCE_AddOn2_0234567389					        E0234567389
    Read  Mirror_Horizontal_UPCE_AddOn5_0234567389759					    E0234567389759
    Read  Mirror_Vertical_UPCE_02345673					                    E02345673
    Read  Mirror_Vertical_UPCE_AddOn2_0234567389					        E0234567389
    Read  Mirror_Vertical_UPCE_AddOn5_0234567389759					        E0234567389759
Senario 4: Disable Mirror_EAN8
    [Documentation]  Default the HH can read 1D Mirror and Normal
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                                           Expected result
    Read  EAN8_12345670					                                    FF12345670
    Read  EAN8_AddOn2_1234567012					                        FF1234567012
    Read  EAN8_AddOn5_1234567012345					                        FF1234567012345
    Read  Mirror_Horizontal_EAN8_12345670					                FF12345670
    Read  Mirror_Horizontal_EAN8_AddOn2_1234567012					        FF1234567012
    Read  Mirror_Horizontal_EAN8_AddOn5_1234567012345					    FF1234567012345
    Read  Mirror_Vertical_EAN8_12345670					                    FF12345670
    Read  Mirror_Vertical_EAN8_AddOn2_1234567012					        FF1234567012
    Read  Mirror_Vertical_EAN8_AddOn5_1234567012345					        FF1234567012345
Senario 5: Disable Mirror_EAN13
    [Documentation]  Default the HH can read 1D Mirror and Normal
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
    Read  Mirror_Horizontal_ISBN13_9781234567897					        I123456789X
    Read  Mirror_Horizontal_ISBN13_9794567890129					        I4567890124
    Read  Mirror_Horizontal_ISBN13_AddOn5_978817525766512345			    I817525766012345
    Read  Mirror_Horizontal_ISSN_9770264359008					            n02643596
    Read  Mirror_Horizontal_ISSN_AddOn2_977123456789812					    n1234567912
    Read  Mirror_Vertical_ISBN13_9781234567897					            I123456789X
    Read  Mirror_Vertical_ISBN13_9794567890129					            I4567890124
    Read  Mirror_Vertical_ISBN13_AddOn5_978817525766512345					I817525766012345
    Read  Mirror_Vertical_ISSN_9770264359008					            n02643596
    Read  Mirror_Vertical_ISSN_AddOn2_977123456789812					    n1234567912
    Read  Mirror_Horizontal_EAN13_1234567890128					            F1234567890128
    Read  Mirror_Horizontal_EAN13_AddOn2_123456789012812					F123456789012812
    Read  Mirror_Horizontal_EAN13_AddOn5_123456789012812345					F123456789012812345
    Read  Mirror_Vertical_EAN13_1234567890128					            F1234567890128
    Read  Mirror_Vertical_EAN13_AddOn2_123456789012812					    F123456789012812
    Read  Mirror_Vertical_EAN13_AddOn5_123456789012812345					F123456789012812345
Senario 6: Disable Mirror_Code39
    [Documentation]  Default the HH can read 1D Mirror and Normal
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  Code39_SW7472					                    *SW7472
    Read  Code39_FullASCII_A12@k)					        *A12@k)
    Read  Code39CIP_1234562					                Y1234562
    Read  Code39TriOptic_456123					            $T456123
    Read  Mirror_Horizontal_Code39_SW7472					*SW7472
    Read  Mirror_Horizontal_Code39_FullASCII_A12@k)			*A12@k)
    Read  Mirror_Horizontal_Code39CIP_1234562				Y1234562
    Read  Mirror_Horizontal_Code39TriOptic_456123			$T456123
    Read  Mirror_Vertical_Code39_SW7472					*SW7472
    Read  Mirror_Vertical_Code39_FullASCII_A12@k)			*A12@k)
    Read  Mirror_Vertical_Code39CIP_1234562				Y1234562
    Read  Mirror_Vertical_Code39TriOptic_456123			$T456123
Senario 7: Disable Mirror_GS1DataBar
    [Documentation]  Default the HH can read 1D Mirror and Normal. But can't read Mirror Stack
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                                       Expected result
    Read  GS1DataBar14_0112345678901231					                    R40112345678901231
    Read  GS1DataBarTruncated_0112345678901231					            R40112345678901231
    Read  GS1DataBarStacked_0112345678901231					            R40112345678901231
    Read  GS1DataBarStackedOmnidirectional_0112345678901231					R40112345678901231
    Read  GS1DataBarLimited_0112345678901231					            RL0112345678901231
    Read  GS1DataBarExpanded_010123456789012313					            RX0123456789012313
    Read  GS1DataBarExpandedStacked_010123456789012313					    RX0123456789012313
    Read  Mirror_Horizontal_GS1DataBar14_0112345678901231					                R40112345678901231
    Read  Mirror_Horizontal_GS1DataBarTruncated_0112345678901231					        R40112345678901231
    Read  Mirror_Horizontal_GS1DataBarStacked_0112345678901231					            ${EMPTY}
    Read  Mirror_Horizontal_GS1DataBarStackedOmnidirectional_0112345678901231				${EMPTY}
    Read  Mirror_Horizontal_GS1DataBarLimited_0112345678901231					            RL0112345678901231
    Read  Mirror_Horizontal_GS1DataBarExpanded_010123456789012313					        RX0123456789012313
    Read  Mirror_Horizontal_GS1DataBarExpandedStacked_010123456789012313					${EMPTY}
Senario 8: Disable Mirror_Code128
    [Documentation]  Default the HH can read 1D Mirror and Normal
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  Code128_SEGH#%SG23h					                            |#SEGH#%SG23h
    Read  EANUCC128_SEGH#%SG23f					                            ]C1SEGH#%SG23f
    Read  ISBT128					                                        |#f=ADonaID1234=%BloodCD12
    Read  Mirror_Horizontal_Code128_SEGH#%SG23h					                            |#SEGH#%SG23h
    Read  Mirror_Horizontal_EANUCC128_SEGH#%SG23f					                            ]C1SEGH#%SG23f
    Read  Mirror_Horizontal_ISBT128					                                        |#f=ADonaID1234=%BloodCD12
    Read  Mirror_Vertical_Code128_SEGH#%SG23h					                            |#SEGH#%SG23h
    Read  Mirror_Vertical_EANUCC128_SEGH#%SG23f					                            ]C1SEGH#%SG23f
    Read  Mirror_Vertical_ISBT128					                                        |#f=ADonaID1234=%BloodCD12
Senario 9: Disable Mirror_Code93
    [Documentation]  Default the HH can read 1D Mirror and Normal
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  Code93					                                        &HY$AB C/+71
    Read  Code93FullASCII					                                &!%JVS)*14k
    Read  Mirror_Horizontal_Code93					                                        &HY$AB C/+71
    Read  Mirror_Horizontal_Code93FullASCII					                                &!%JVS)*14k
    Read  Mirror_Vertical_Code93					                                        &HY$AB C/+71
    Read  Mirror_Vertical_Code93FullASCII					                                &!%JVS)*14k
Senario 10: Disable Mirror_Code11
    [Documentation]  Default the HH can read 1D Mirror and Normal
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  Code11_CK2_1240					                CE1240
    Read  Mirror_Horizontal_Code11_CK2_1240					                CE1240
    Read  Mirror_Vertical_Code11_CK2_1240					                CE1240
Senario 11: Disable Mirror_Code32
    [Documentation]  Default the HH can read 1D Mirror and Normal
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                                       Expected result
    Read  Code32_34567890					                                A34567890
    Read  Mirror_Horizontal_Code32_34567890					                A34567890
    Read  Mirror_Vertical_Code32_34567890					                A34567890
Senario 12: Disable Mirror_MSI
    [Documentation]  Default the HH can read 1D Mirror and Normal
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  MSI_453621					                    @453621
    Read  MSI_CK1_4536215					                @4536215
    Read  MSI_CK2_45362159					                @45362159
    Read  Mirror_Horizontal_MSI_453621					                    @453621
    Read  Mirror_Horizontal_MSI_CK1_4536215					                @4536215
    Read  Mirror_Horizontal_MSI_CK2_45362159					            @45362159
    Read  Mirror_Vertical_MSI_453621					                    @453621
    Read  Mirror_Vertical_MSI_CK1_4536215					                @4536215
    Read  Mirror_Vertical_MSI_CK2_45362159					                @45362159
Senario 13: Disable Mirror_Codabar
    [Documentation]  Default the HH can read 1D Mirror and Normal
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  Codabar_C23049$B					                %c23049$b
    Read  QT_ABCCodabar(2Labels)					        Sc12344333c
    Read  Mirror_Horizontal_Codabar_C23049$B					            %c23049$b
    Read  Mirror_Horizontal_QT_ABCCodabar(2Labels)					        Sc12344333c
    Read  Mirror_Vertical_Codabar_C23049$B					                %c23049$b
    Read  Mirror_Vertical_QT_ABCCodabar(2Labels)					        Sc12344333c
Senario 14: Disable Mirror_Code2of5
    [Documentation]  Default the HH can read 1D Mirror and Normal
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
    Read  Mirror_Horizontal_Code2of5Interleaved_123457					    i123457
    Read  Mirror_Horizontal_Code2of5Industrial_12345678					    s12345678
    Read  Mirror_Horizontal_Discrete2of5_34564678					        s34564678
    Read  Mirror_Horizontal_Code2of5IATA_123412345678903					IA123412345678903
    Read  Mirror_Horizontal_Follett2of5_T0123456					        OT 0123456
    Read  Mirror_Horizontal_Code2of5Matrix_08312865					        g08312865
    Read  Mirror_Horizontal_QT_Interleaved2of5CIPHR   					    e9876544
    Read  Mirror_Horizontal_Code2of5IATA_0986275650					        W0986275650
    Read  Mirror_Vertical_Code2of5Interleaved_123457					    i123457
    Read  Mirror_Vertical_Code2of5Industrial_12345678					    s12345678
    Read  Mirror_Vertical_Discrete2of5_34564678					            s34564678
    Read  Mirror_Vertical_Code2of5IATA_123412345678903					    IA123412345678903
    Read  Mirror_Vertical_Follett2of5_T0123456					            OT 0123456
    Read  Mirror_Vertical_Code2of5Matrix_08312865					        g08312865
    Read  Mirror_Vertical_QT_Interleaved2of5CIPHR   					    e9876544
    Read  Mirror_Vertical_Code2of5IATA_0986275650					        W0986275650

Senario 15: Disable Mirror_Plessey
    [Documentation]  Default the HH can read 1D Mirror and Normal
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  PlesseyBidirectional_123456E000					a123456E000
    Read  Mirror_Horizontal_PlesseyBidirectional_123456E000					a123456E000
    Read  Mirror_Vertical_PlesseyBidirectional_123456E000					a123456E000
Senario 16: Disable Mirror_Composite
    [Documentation]  Default the HH can read 1D Mirror and Normal.
    ...  For 2D: HH can read all 2D Normal Symbologies but not Mirror (except Chinese, PDF417, Aztec)
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
    Read  Mirror_Horizontal_GS1DataBar14_Composite					        ${EMPTY}
    Read  Mirror_Horizontal_GS1DataBarTruncated_Composite					${EMPTY}
    Read  Mirror_Horizontal_GS1DataBarStacked_Composite					    ${EMPTY}
    Read  Mirror_Horizontal_GS1DataBarStackedOmnidirectional_Composite		${EMPTY}
    Read  Mirror_Horizontal_GS1DataBarLimited_Composite					    ${EMPTY}
    Read  Mirror_Horizontal_GS1DataBarExpanded_Composite					${EMPTY}
    Read  Mirror_Horizontal_GS1DataBarExpandedStacked_Composite				${EMPTY}
    Read  Mirror_Horizontal_EAN128_CCA1					                    ${EMPTY}
    Read  Mirror_Horizontal_EAN8_Composite					                FF07894565 OR/ FF07894565789456
    Read  Mirror_Horizontal_EAN13_Composite					                F1234567890128 OR/ F123456789012812345678901231234567890123
    Read  Mirror_Horizontal_UPCA_Composite					                A123456789012 OR/ A12345678901212345678901231234567890123
    Read  Mirror_Horizontal_UPCE_Composite					                E01234565 OR/ E01234565HelloAB CC-A compo
    Read  Mirror_Horizontal_EAN128_CCA2					                                            ]C1012092011901233abcde
    Read  Mirror_Vertical_GS1DataBar14_Composite					        ${EMPTY}
    Read  Mirror_Vertical_GS1DataBarTruncated_Composite					    ${EMPTY}
    Read  Mirror_Vertical_GS1DataBarStacked_Composite					    ${EMPTY}
    Read  Mirror_Vertical_GS1DataBarStackedOmnidirectional_Composite		${EMPTY}
    Read  Mirror_Vertical_GS1DataBarLimited_Composite					    RL011234567890123112345678901231234567890123
    Read  Mirror_Vertical_GS1DataBarExpanded_Composite					    ${EMPTY}
    Read  Mirror_Vertical_GS1DataBarExpandedStacked_Composite				${EMPTY}
    Read  Mirror_Vertical_EAN128_CCA1					                    ${EMPTY}
    Read  Mirror_Vertical_EAN8_Composite					                FF07894565 OR/ FF07894565789456
    Read  Mirror_Vertical_EAN13_Composite					                F1234567890128 OR/ F123456789012812345678901231234567890123
    Read  Mirror_Vertical_UPCA_Composite					                A123456789012 OR/ A12345678901212345678901231234567890123
    Read  Mirror_Vertical_UPCE_Composite					                E01234565 OR/ E01234565HelloAB CC-A compo
    Read  Mirror_Vertical_EAN128_CCA2					                    ${EMPTY}

Senario 17: Enable Mirror_UPCA
    [Documentation]  Default the HH can read 1D Mirror and Normal
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Send  $S,CARMR01,Ar                                 $>,>,>
    Read  UPCA_123456789012					                A123456789012
    Read  UPCA_AddOn2_12345678901212					    A12345678901212
    Read  UPCA_AddOn5_12345678901212345					    A12345678901212345
    Read  UPCA_Coupon_523456789010					        A523456789010
    Read  Mirror_Vertical_UPCA_123456789012					                A123456789012
    Read  Mirror_Vertical_UPCA_AddOn2_12345678901212					    A12345678901212
    Read  Mirror_Vertical_UPCA_AddOn5_12345678901212345					    A12345678901212345
    Read  Mirror_Vertical_UPCA_Coupon_523456789010					        A523456789010
    Read  Mirror_Horizontal_UPCA_123456789012					                A123456789012
    Read  Mirror_Horizontal_UPCA_AddOn2_12345678901212					    A12345678901212
    Read  Mirror_Horizontal_UPCA_AddOn5_12345678901212345					    A12345678901212345
    Read  Mirror_Horizontal_UPCA_Coupon_523456789010					        A523456789010
Senario 18: Enable Mirror_UPCE
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                                           Expected result
    Read  UPCE_02345673					                                    E02345673
    Read  UPCE_AddOn2_0234567389					                        E0234567389
    Read  UPCE_AddOn5_0234567389759					                        E0234567389759
    Read  Mirror_Horizontal_UPCE_02345673					                E02345673
    Read  Mirror_Horizontal_UPCE_AddOn2_0234567389					        E0234567389
    Read  Mirror_Horizontal_UPCE_AddOn5_0234567389759					    E0234567389759
    Read  Mirror_Vertical_UPCE_02345673					                    E02345673
    Read  Mirror_Vertical_UPCE_AddOn2_0234567389					        E0234567389
    Read  Mirror_Vertical_UPCE_AddOn5_0234567389759					        E0234567389759
Senario 19: Enable Mirror_EAN8
    [Documentation]
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                                           Expected result
    Read  EAN8_12345670					                                    FF12345670
    Read  EAN8_AddOn2_1234567012					                        FF1234567012
    Read  EAN8_AddOn5_1234567012345					                        FF1234567012345
    Read  Mirror_Horizontal_EAN8_12345670					                FF12345670
    Read  Mirror_Horizontal_EAN8_AddOn2_1234567012					        FF1234567012
    Read  Mirror_Horizontal_EAN8_AddOn5_1234567012345					    FF1234567012345
    Read  Mirror_Vertical_EAN8_12345670					                    FF12345670
    Read  Mirror_Vertical_EAN8_AddOn2_1234567012					        FF1234567012
    Read  Mirror_Vertical_EAN8_AddOn5_1234567012345					        FF1234567012345
Senario 20: Enable Mirror_EAN13
    [Documentation]
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
    Read  Mirror_Horizontal_ISBN13_9781234567897					        I123456789X
    Read  Mirror_Horizontal_ISBN13_9794567890129					        I4567890124
    Read  Mirror_Horizontal_ISBN13_AddOn5_978817525766512345			    I817525766012345
    Read  Mirror_Horizontal_ISSN_9770264359008					            n02643596
    Read  Mirror_Horizontal_ISSN_AddOn2_977123456789812					    n1234567912
    Read  Mirror_Vertical_ISBN13_9781234567897					            I123456789X
    Read  Mirror_Vertical_ISBN13_9794567890129					            I4567890124
    Read  Mirror_Vertical_ISBN13_AddOn5_978817525766512345					I817525766012345
    Read  Mirror_Vertical_ISSN_9770264359008					            n02643596
    Read  Mirror_Vertical_ISSN_AddOn2_977123456789812					    n1234567912
    Read  Mirror_Horizontal_EAN13_1234567890128					            F1234567890128
    Read  Mirror_Horizontal_EAN13_AddOn2_123456789012812					F123456789012812
    Read  Mirror_Horizontal_EAN13_AddOn5_123456789012812345					F123456789012812345
    Read  Mirror_Vertical_EAN13_1234567890128					            F1234567890128
    Read  Mirror_Vertical_EAN13_AddOn2_123456789012812					    F123456789012812
    Read  Mirror_Vertical_EAN13_AddOn5_123456789012812345					F123456789012812345
Senario 21: Enable Mirror_Code39
    [Documentation]
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  Code39_SW7472					                    *SW7472
    Read  Code39_FullASCII_A12@k)					        *A12@k)
    Read  Code39CIP_1234562					                Y1234562
    Read  Code39TriOptic_456123					            $T456123
    Read  Mirror_Horizontal_Code39_SW7472					*SW7472
    Read  Mirror_Horizontal_Code39_FullASCII_A12@k)			*A12@k)
    Read  Mirror_Horizontal_Code39CIP_1234562				Y1234562
    Read  Mirror_Horizontal_Code39TriOptic_456123			$T456123
    Read  Mirror_Vertical_Code39_SW7472					*SW7472
    Read  Mirror_Vertical_Code39_FullASCII_A12@k)			*A12@k)
    Read  Mirror_Vertical_Code39CIP_1234562				Y1234562
    Read  Mirror_Vertical_Code39TriOptic_456123			$T456123
Senario 22: Enable Mirror_GS1DataBar
    [Documentation]
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                                       Expected result
    Read  GS1DataBar14_0112345678901231					                    R40112345678901231
    Read  GS1DataBarTruncated_0112345678901231					            R40112345678901231
    Read  GS1DataBarStacked_0112345678901231					            ${EMPTY}
    Read  GS1DataBarStackedOmnidirectional_0112345678901231					${EMPTY}
    Read  GS1DataBarLimited_0112345678901231					            RL0112345678901231
    Read  GS1DataBarExpanded_010123456789012313					            RX0123456789012313
    Read  GS1DataBarExpandedStacked_010123456789012313					    ${EMPTY}
    Read  Mirror_Horizontal_GS1DataBar14_0112345678901231					                R40112345678901231
    Read  Mirror_Horizontal_GS1DataBarTruncated_0112345678901231					        R40112345678901231
    Read  Mirror_Horizontal_GS1DataBarStacked_0112345678901231					            R40112345678901231
    Read  Mirror_Horizontal_GS1DataBarStackedOmnidirectional_0112345678901231				R40112345678901231
    Read  Mirror_Horizontal_GS1DataBarLimited_0112345678901231					            RL0112345678901231
    Read  Mirror_Horizontal_GS1DataBarExpanded_010123456789012313					        RX0123456789012313
    Read  Mirror_Horizontal_GS1DataBarExpandedStacked_010123456789012313					RX0123456789012313
Senario 23: Enable Mirror_Code128
    [Documentation]
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  Code128_SEGH#%SG23h					                            |#SEGH#%SG23h
    Read  EANUCC128_SEGH#%SG23f					                            ]C1SEGH#%SG23f
    Read  ISBT128					                                        |#f=ADonaID1234=%BloodCD12
    Read  Mirror_Horizontal_Code128_SEGH#%SG23h					                            |#SEGH#%SG23h
    Read  Mirror_Horizontal_EANUCC128_SEGH#%SG23f					                            ]C1SEGH#%SG23f
    Read  Mirror_Horizontal_ISBT128					                                        |#f=ADonaID1234=%BloodCD12
    Read  Mirror_Vertical_Code128_SEGH#%SG23h					                            |#SEGH#%SG23h
    Read  Mirror_Vertical_EANUCC128_SEGH#%SG23f					                            ]C1SEGH#%SG23f
    Read  Mirror_Vertical_ISBT128					                                        |#f=ADonaID1234=%BloodCD12
Senario 24: Enable Mirror_Code93
    [Documentation]
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  Code93					                                        &HY$AB C/+71
    Read  Code93FullASCII					                                &!%JVS)*14k
    Read  Mirror_Horizontal_Code93					                                        &HY$AB C/+71
    Read  Mirror_Horizontal_Code93FullASCII					                                &!%JVS)*14k
    Read  Mirror_Vertical_Code93					                                        &HY$AB C/+71
    Read  Mirror_Vertical_Code93FullASCII					                                &!%JVS)*14k
Senario 25: Enable Mirror_Code11
    [Documentation]
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  Code11_CK2_1240					                CE1240
    Read  Mirror_Horizontal_Code11_CK2_1240					                CE1240
    Read  Mirror_Vertical_Code11_CK2_1240					                CE1240
Senario 26: Enable Mirror_Code32
    [Documentation]
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                                       Expected result
    Read  Code32_34567890					                                A34567890
    Read  Mirror_Horizontal_Code32_34567890					                A34567890
    Read  Mirror_Vertical_Code32_34567890					                A34567890
Senario 27: Enable Mirror_MSI
    [Documentation]
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  MSI_453621					                    @453621
    Read  MSI_CK1_4536215					                @4536215
    Read  MSI_CK2_45362159					                @45362159
    Read  Mirror_Horizontal_MSI_453621					                    @453621
    Read  Mirror_Horizontal_MSI_CK1_4536215					                @4536215
    Read  Mirror_Horizontal_MSI_CK2_45362159					            @45362159
    Read  Mirror_Vertical_MSI_453621					                    @453621
    Read  Mirror_Vertical_MSI_CK1_4536215					                @4536215
    Read  Mirror_Vertical_MSI_CK2_45362159					                @45362159
Senario 28: Enable Mirror_Codabar
    [Documentation]
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  Codabar_C23049$B					                %c23049$b
    Read  QT_ABCCodabar(2Labels)					        Sc12344333c
    Read  Mirror_Horizontal_Codabar_C23049$B					            %c23049$b
    Read  Mirror_Horizontal_QT_ABCCodabar(2Labels)					        Sc12344333c
    Read  Mirror_Vertical_Codabar_C23049$B					                %c23049$b
    Read  Mirror_Vertical_QT_ABCCodabar(2Labels)					        Sc12344333c
Senario 29: Enable Mirror_Code2of5
    [Documentation]
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
    Read  Mirror_Horizontal_Code2of5Interleaved_123457					    i123457
    Read  Mirror_Horizontal_Code2of5Industrial_12345678					    s12345678
    Read  Mirror_Horizontal_Discrete2of5_34564678					        s34564678
    Read  Mirror_Horizontal_Code2of5IATA_123412345678903					IA123412345678903
    Read  Mirror_Horizontal_Follett2of5_T0123456					        OT 0123456
    Read  Mirror_Horizontal_Code2of5Matrix_08312865					        g08312865
    Read  Mirror_Horizontal_QT_Interleaved2of5CIPHR   					    e9876544
    Read  Mirror_Horizontal_Code2of5IATA_0986275650					        W0986275650
    Read  Mirror_Vertical_Code2of5Interleaved_123457					    i123457
    Read  Mirror_Vertical_Code2of5Industrial_12345678					    s12345678
    Read  Mirror_Vertical_Discrete2of5_34564678					            s34564678
    Read  Mirror_Vertical_Code2of5IATA_123412345678903					    IA123412345678903
    Read  Mirror_Vertical_Follett2of5_T0123456					            OT 0123456
    Read  Mirror_Vertical_Code2of5Matrix_08312865					        g08312865
    Read  Mirror_Vertical_QT_Interleaved2of5CIPHR   					    e9876544
    Read  Mirror_Vertical_Code2of5IATA_0986275650					        W0986275650

Senario 30: Enable Mirror_Plessey
    [Documentation]
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  PlesseyBidirectional_123456E000					a123456E000
    Read  Mirror_Horizontal_PlesseyBidirectional_123456E000					a123456E000
    Read  Mirror_Vertical_PlesseyBidirectional_123456E000					a123456E000
Senario 31: Enable Mirror_Composite
    [Documentation]
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  GS1DataBar14_Composite_011234567890123112345678901231234567890123					        ${EMPTY}
    Read  GS1DataBarTruncated_Composite_011234567890123112345678901231234567890123					${EMPTY}
    Read  GS1DataBarStacked_Composite_011234567890123112345678901231234567890123					${EMPTY}
    Read  GS1DataBarStackedOmnidirectional_Composite_011234567890123112345678901231234567890123		${EMPTY}
    Read  GS1DataBarLimited_Composite_011234567890123112345678901231234567890123					${EMPTY}
    Read  GS1DataBarExpanded_Composite					                                            ${EMPTY}
    Read  GS1DataBarExpandedStacked_Composite				                                        ${EMPTY}
    Read  EAN128_CCA1					                                                            ${EMPTY}
    Read  EAN8_Composite_07894565789456					                                            ${EMPTY}
    Read  EAN13_Composite_123456789012812345678901231234567890123					                ${EMPTY}
    Read  UPCA_Composite_12345678901212345678901231234567890123					                    ${EMPTY}
    Read  UPCE_Composite_01234565HelloABCC-Acompo					                E01234565 OR/ E01234565HelloAB CC-A compo
    Read  EAN128_CCA2					                                            ]C1012092011901233abcde
    Read  Mirror_Horizontal_GS1DataBar14_Composite					        R4011234567890123112345678901231234567890123
    Read  Mirror_Horizontal_GS1DataBarTruncated_Composite					            R4011234567890123112345678901231234567890123
    Read  Mirror_Horizontal_GS1DataBarStacked_Composite					    R4011234567890123112345678901231234567890123
    Read  Mirror_Horizontal_GS1DataBarStackedOmnidirectional_Composite					R4011234567890123112345678901231234567890123
    Read  Mirror_Horizontal_GS1DataBarLimited_Composite					    RL011234567890123112345678901231234567890123
    Read  Mirror_Horizontal_GS1DataBarExpanded_Composite					    RX01012345678901282142349283472987423
    Read  Mirror_Horizontal_GS1DataBarExpandedStacked_Composite				RX01209201190123\\x1d19789456
    Read  Mirror_Horizontal_EAN128_CCA1					                    ]C1012092011901233789456
    Read  Mirror_Horizontal_EAN8_Composite					                FF07894565 OR/ FF07894565789456
    Read  Mirror_Horizontal_EAN13_Composite					                F1234567890128 OR/ F123456789012812345678901231234567890123
    Read  Mirror_Horizontal_UPCA_Composite					                A123456789012 OR/ A12345678901212345678901231234567890123
    Read  Mirror_Horizontal_UPCE_Composite					                E01234565 OR/ E01234565HelloAB CC-A compo
    Read  Mirror_Horizontal_EAN128_CCA2					                                            ]C1012092011901233abcde
    Read  Mirror_Vertical_GS1DataBar14_Composite					        R4011234567890123112345678901231234567890123
    Read  Mirror_Vertical_GS1DataBarTruncated_Composite					            R4011234567890123112345678901231234567890123
    Read  Mirror_Vertical_GS1DataBarStacked_Composite					    R4011234567890123112345678901231234567890123
    Read  Mirror_Vertical_GS1DataBarStackedOmnidirectional_Composite					R4011234567890123112345678901231234567890123
    Read  Mirror_Vertical_GS1DataBarLimited_Composite					    RL011234567890123112345678901231234567890123
    Read  Mirror_Vertical_GS1DataBarExpanded_Composite					    RX01012345678901282142349283472987423
    Read  Mirror_Vertical_GS1DataBarExpandedStacked_Composite				RX01209201190123\\x1d19789456
    Read  Mirror_Vertical_EAN128_CCA1					                    ]C1012092011901233789456
    Read  Mirror_Vertical_EAN8_Composite					                FF07894565 OR/ FF07894565789456
    Read  Mirror_Vertical_EAN13_Composite					                F1234567890128 OR/ F123456789012812345678901231234567890123
    Read  Mirror_Vertical_UPCA_Composite					                A123456789012 OR/ A12345678901212345678901231234567890123
    Read  Mirror_Vertical_UPCE_Composite					                E01234565 OR/ E01234565HelloAB CC-A compo
    Read  Mirror_Vertical_EAN128_CCA2					                                            ]C1012092011901233abcde



Senario 32: Enable Both Normal and Mirror_UPCA
    [Documentation]  Default the HH can read 1D Mirror and Normal
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Send  $S,CARMR02,Ar                                 $>,>,>
    Read  UPCA_123456789012					                A123456789012
    Read  UPCA_AddOn2_12345678901212					    A12345678901212
    Read  UPCA_AddOn5_12345678901212345					    A12345678901212345
    Read  UPCA_Coupon_523456789010					        A523456789010
    Read  Mirror_Vertical_UPCA_123456789012					                A123456789012
    Read  Mirror_Vertical_UPCA_AddOn2_12345678901212					    A12345678901212
    Read  Mirror_Vertical_UPCA_AddOn5_12345678901212345					    A12345678901212345
    Read  Mirror_Vertical_UPCA_Coupon_523456789010					        A523456789010
    Read  Mirror_Horizontal_UPCA_123456789012					                A123456789012
    Read  Mirror_Horizontal_UPCA_AddOn2_12345678901212					    A12345678901212
    Read  Mirror_Horizontal_UPCA_AddOn5_12345678901212345					    A12345678901212345
    Read  Mirror_Horizontal_UPCA_Coupon_523456789010					        A523456789010
Senario 33: Enable Both Normal and Mirror_UPCE
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                                           Expected result
    Read  UPCE_02345673					                                    E02345673
    Read  UPCE_AddOn2_0234567389					                        E0234567389
    Read  UPCE_AddOn5_0234567389759					                        E0234567389759
    Read  Mirror_Horizontal_UPCE_02345673					                E02345673
    Read  Mirror_Horizontal_UPCE_AddOn2_0234567389					        E0234567389
    Read  Mirror_Horizontal_UPCE_AddOn5_0234567389759					    E0234567389759
    Read  Mirror_Vertical_UPCE_02345673					                    E02345673
    Read  Mirror_Vertical_UPCE_AddOn2_0234567389					        E0234567389
    Read  Mirror_Vertical_UPCE_AddOn5_0234567389759					        E0234567389759
Senario 34: Enable Both Normal and Mirror_EAN8
    [Documentation]
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                                           Expected result
    Read  EAN8_12345670					                                    FF12345670
    Read  EAN8_AddOn2_1234567012					                        FF1234567012
    Read  EAN8_AddOn5_1234567012345					                        FF1234567012345
    Read  Mirror_Horizontal_EAN8_12345670					                FF12345670
    Read  Mirror_Horizontal_EAN8_AddOn2_1234567012					        FF1234567012
    Read  Mirror_Horizontal_EAN8_AddOn5_1234567012345					    FF1234567012345
    Read  Mirror_Vertical_EAN8_12345670					                    FF12345670
    Read  Mirror_Vertical_EAN8_AddOn2_1234567012					        FF1234567012
    Read  Mirror_Vertical_EAN8_AddOn5_1234567012345					        FF1234567012345
Senario 35: Enable Both Normal and Mirror_EAN13
    [Documentation]
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
    Read  Mirror_Horizontal_ISBN13_9781234567897					        I123456789X
    Read  Mirror_Horizontal_ISBN13_9794567890129					        I4567890124
    Read  Mirror_Horizontal_ISBN13_AddOn5_978817525766512345			    I817525766012345
    Read  Mirror_Horizontal_ISSN_9770264359008					            n02643596
    Read  Mirror_Horizontal_ISSN_AddOn2_977123456789812					    n1234567912
    Read  Mirror_Vertical_ISBN13_9781234567897					            I123456789X
    Read  Mirror_Vertical_ISBN13_9794567890129					            I4567890124
    Read  Mirror_Vertical_ISBN13_AddOn5_978817525766512345					I817525766012345
    Read  Mirror_Vertical_ISSN_9770264359008					            n02643596
    Read  Mirror_Vertical_ISSN_AddOn2_977123456789812					    n1234567912
    Read  Mirror_Horizontal_EAN13_1234567890128					            F1234567890128
    Read  Mirror_Horizontal_EAN13_AddOn2_123456789012812					F123456789012812
    Read  Mirror_Horizontal_EAN13_AddOn5_123456789012812345					F123456789012812345
    Read  Mirror_Vertical_EAN13_1234567890128					            F1234567890128
    Read  Mirror_Vertical_EAN13_AddOn2_123456789012812					    F123456789012812
    Read  Mirror_Vertical_EAN13_AddOn5_123456789012812345					F123456789012812345
Senario 36: Enable Both Normal and Mirror_Code39
    [Documentation]
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  Code39_SW7472					                    *SW7472
    Read  Code39_FullASCII_A12@k)					        *A12@k)
    Read  Code39CIP_1234562					                Y1234562
    Read  Code39TriOptic_456123					            $T456123
    Read  Mirror_Horizontal_Code39_SW7472					*SW7472
    Read  Mirror_Horizontal_Code39_FullASCII_A12@k)			*A12@k)
    Read  Mirror_Horizontal_Code39CIP_1234562				Y1234562
    Read  Mirror_Horizontal_Code39TriOptic_456123			$T456123
    Read  Mirror_Vertical_Code39_SW7472					*SW7472
    Read  Mirror_Vertical_Code39_FullASCII_A12@k)			*A12@k)
    Read  Mirror_Vertical_Code39CIP_1234562				Y1234562
    Read  Mirror_Vertical_Code39TriOptic_456123			$T456123
Senario 37: Enable Both Normal and Mirror_GS1DataBar
    [Documentation]
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                                       Expected result
    Read  GS1DataBar14_0112345678901231					                    R40112345678901231
    Read  GS1DataBarTruncated_0112345678901231					            R40112345678901231
    Read  GS1DataBarStacked_0112345678901231					            R40112345678901231
    Read  GS1DataBarStackedOmnidirectional_0112345678901231					R40112345678901231
    Read  GS1DataBarLimited_0112345678901231					            RL0112345678901231
    Read  GS1DataBarExpanded_010123456789012313					            RX0123456789012313
    Read  GS1DataBarExpandedStacked_010123456789012313					    RX0123456789012313
    Read  Mirror_Horizontal_GS1DataBar14_0112345678901231					                R40112345678901231
    Read  Mirror_Horizontal_GS1DataBarTruncated_0112345678901231					        R40112345678901231
    Read  Mirror_Horizontal_GS1DataBarStacked_0112345678901231					            R40112345678901231
    Read  Mirror_Horizontal_GS1DataBarStackedOmnidirectional_0112345678901231				R40112345678901231
    Read  Mirror_Horizontal_GS1DataBarLimited_0112345678901231					            RL0112345678901231
    Read  Mirror_Horizontal_GS1DataBarExpanded_010123456789012313					        RX0123456789012313
    Read  Mirror_Horizontal_GS1DataBarExpandedStacked_010123456789012313					RX0123456789012313
Senario 38: Enable Both Normal and Mirror_Code128
    [Documentation]
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  Code128_SEGH#%SG23h					                            |#SEGH#%SG23h
    Read  EANUCC128_SEGH#%SG23f					                            ]C1SEGH#%SG23f
    Read  ISBT128					                                        |#f=ADonaID1234=%BloodCD12
    Read  Mirror_Horizontal_Code128_SEGH#%SG23h					                            |#SEGH#%SG23h
    Read  Mirror_Horizontal_EANUCC128_SEGH#%SG23f					                            ]C1SEGH#%SG23f
    Read  Mirror_Horizontal_ISBT128					                                        |#f=ADonaID1234=%BloodCD12
    Read  Mirror_Vertical_Code128_SEGH#%SG23h					                            |#SEGH#%SG23h
    Read  Mirror_Vertical_EANUCC128_SEGH#%SG23f					                            ]C1SEGH#%SG23f
    Read  Mirror_Vertical_ISBT128					                                        |#f=ADonaID1234=%BloodCD12
Senario 39: Enable Both Normal and Mirror_Code93
    [Documentation]
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  Code93					                                        &HY$AB C/+71
    Read  Code93FullASCII					                                &!%JVS)*14k
    Read  Mirror_Horizontal_Code93					                                        &HY$AB C/+71
    Read  Mirror_Horizontal_Code93FullASCII					                                &!%JVS)*14k
    Read  Mirror_Vertical_Code93					                                        &HY$AB C/+71
    Read  Mirror_Vertical_Code93FullASCII					                                &!%JVS)*14k
Senario 40: Enable Both Normal and Mirror_Code11
    [Documentation]
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  Code11_CK2_1240					                CE1240
    Read  Mirror_Horizontal_Code11_CK2_1240					                CE1240
    Read  Mirror_Vertical_Code11_CK2_1240					                CE1240
Senario 41: Enable Both Normal and Mirror_Code32
    [Documentation]
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                                       Expected result
    Read  Code32_34567890					                                A34567890
    Read  Mirror_Horizontal_Code32_34567890					                A34567890
    Read  Mirror_Vertical_Code32_34567890					                A34567890
Senario 42: Enable Both Normal and Mirror_MSI
    [Documentation]
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  MSI_453621					                    @453621
    Read  MSI_CK1_4536215					                @4536215
    Read  MSI_CK2_45362159					                @45362159
    Read  Mirror_Horizontal_MSI_453621					                    @453621
    Read  Mirror_Horizontal_MSI_CK1_4536215					                @4536215
    Read  Mirror_Horizontal_MSI_CK2_45362159					            @45362159
    Read  Mirror_Vertical_MSI_453621					                    @453621
    Read  Mirror_Vertical_MSI_CK1_4536215					                @4536215
    Read  Mirror_Vertical_MSI_CK2_45362159					                @45362159
Senario 43: Enable Both Normal and Mirror_Codabar
    [Documentation]
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  Codabar_C23049$B					                %c23049$b
    Read  QT_ABCCodabar(2Labels)					        Sc12344333c
    Read  Mirror_Horizontal_Codabar_C23049$B					            %c23049$b
    Read  Mirror_Horizontal_QT_ABCCodabar(2Labels)					        Sc12344333c
    Read  Mirror_Vertical_Codabar_C23049$B					                %c23049$b
    Read  Mirror_Vertical_QT_ABCCodabar(2Labels)					        Sc12344333c
Senario 44: Enable Both Normal and Mirror_Code2of5
    [Documentation]
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
    Read  Mirror_Horizontal_Code2of5Interleaved_123457					    i123457
    Read  Mirror_Horizontal_Code2of5Industrial_12345678					    s12345678
    Read  Mirror_Horizontal_Discrete2of5_34564678					        s34564678
    Read  Mirror_Horizontal_Code2of5IATA_123412345678903					IA123412345678903
    Read  Mirror_Horizontal_Follett2of5_T0123456					        OT 0123456
    Read  Mirror_Horizontal_Code2of5Matrix_08312865					        g08312865
    Read  Mirror_Horizontal_QT_Interleaved2of5CIPHR   					    e9876544
    Read  Mirror_Horizontal_Code2of5IATA_0986275650					        W0986275650
    Read  Mirror_Vertical_Code2of5Interleaved_123457					    i123457
    Read  Mirror_Vertical_Code2of5Industrial_12345678					    s12345678
    Read  Mirror_Vertical_Discrete2of5_34564678					            s34564678
    Read  Mirror_Vertical_Code2of5IATA_123412345678903					    IA123412345678903
    Read  Mirror_Vertical_Follett2of5_T0123456					            OT 0123456
    Read  Mirror_Vertical_Code2of5Matrix_08312865					        g08312865
    Read  Mirror_Vertical_QT_Interleaved2of5CIPHR   					    e9876544
    Read  Mirror_Vertical_Code2of5IATA_0986275650					        W0986275650

Senario 45: Enable Both Normal and Mirror_Plessey
    [Documentation]
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  PlesseyBidirectional_123456E000					a123456E000
    Read  Mirror_Horizontal_PlesseyBidirectional_123456E000					a123456E000
    Read  Mirror_Vertical_PlesseyBidirectional_123456E000					a123456E000
Senario 46: Enable Both Normal and Mirror_Composite
    [Documentation]
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
    Read  Mirror_Horizontal_GS1DataBar14_Composite					        R4011234567890123112345678901231234567890123
    Read  Mirror_Horizontal_GS1DataBarTruncated_Composite					R4011234567890123112345678901231234567890123
    Read  Mirror_Horizontal_GS1DataBarStacked_Composite					    R4011234567890123112345678901231234567890123
    Read  Mirror_Horizontal_GS1DataBarStackedOmnidirectional_Composite		R4011234567890123112345678901231234567890123
    Read  Mirror_Horizontal_GS1DataBarLimited_Composite					    RL011234567890123112345678901231234567890123
    Read  Mirror_Horizontal_GS1DataBarExpanded_Composite					RX01012345678901282142349283472987423
    Read  Mirror_Horizontal_GS1DataBarExpandedStacked_Composite				RX01209201190123\\x1d19789456
    Read  Mirror_Horizontal_EAN128_CCA1					                    ]C1012092011901233789456
    Read  Mirror_Horizontal_EAN8_Composite					                FF07894565 OR/ FF07894565789456
    Read  Mirror_Horizontal_EAN13_Composite					                F1234567890128 OR/ F123456789012812345678901231234567890123
    Read  Mirror_Horizontal_UPCA_Composite					                A123456789012 OR/ A12345678901212345678901231234567890123
    Read  Mirror_Horizontal_UPCE_Composite					                E01234565 OR/ E01234565HelloAB CC-A compo
    Read  Mirror_Horizontal_EAN128_CCA2					                    ]C1012092011901233abcde
    Read  Mirror_Vertical_GS1DataBar14_Composite					        R4011234567890123112345678901231234567890123
    Read  Mirror_Vertical_GS1DataBarTruncated_Composite					    R4011234567890123112345678901231234567890123
    Read  Mirror_Vertical_GS1DataBarStacked_Composite					    R4011234567890123112345678901231234567890123
    Read  Mirror_Vertical_GS1DataBarStackedOmnidirectional_Composite		R4011234567890123112345678901231234567890123
    Read  Mirror_Vertical_GS1DataBarLimited_Composite					    RL011234567890123112345678901231234567890123
    Read  Mirror_Vertical_GS1DataBarExpanded_Composite					    RX01012345678901282142349283472987423
    Read  Mirror_Vertical_GS1DataBarExpandedStacked_Composite				RX01209201190123\\x1d19789456
    Read  Mirror_Vertical_EAN128_CCA1					                    ]C1012092011901233789456
    Read  Mirror_Vertical_EAN8_Composite					                FF07894565 OR/ FF07894565789456
    Read  Mirror_Vertical_EAN13_Composite					                F1234567890128 OR/ F123456789012812345678901231234567890123
    Read  Mirror_Vertical_UPCA_Composite					                A123456789012 OR/ A12345678901212345678901231234567890123
    Read  Mirror_Vertical_UPCE_Composite					                E01234565 OR/ E01234565HelloAB CC-A compo
    Read  Mirror_Vertical_EAN128_CCA2					                    ]C1012092011901233abcde