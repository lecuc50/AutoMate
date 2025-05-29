*** settings ***
Documentation  See [http://www.robotframework.org]|robot framework website]
Test Tags
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
Suite Teardown  Run Keywords   ExitSP
...             AND   ClosePort
*** Variables ***
${current_directory}         ${data_source}\\Service_Port_Mode


*** test cases ***
Check that AIEN tag and IDCO tag work
    [Documentation]  Verify that label ID and AIM ID display when enable AIEN and IDCO
    [Tags]      RS232_STD      USB_COM      USB_CPS
    #Description                                                    Expected Result
    Send   $S,CAIEN01,CIDCO01,Ar                                    $>,>,>,>
    Read   UPCA_123456789012                                        F]E00123456789012
    EnterSP
    Send   $cAIEN,cIDCO                                             $>01,>01
    ExitSP


Check that AIEN tag and IDCO tag work
    [Tags]      RS232_WN
    #Description                                                    Expected Result
    Send   $S,CAIEN01,CIDCO01,Ar                                    $>,>,>,>
    Read   UPCA_123456789012                                        A]E00123456789012
    EnterSP
    Send   $cAIEN,cIDCO                                             $>01,>01
    ExitSP

Check that AIEN tag and IDCO tag work
    [Tags]      RS232_OPOS
    #Description                                                    Expected Result
    Send   $S,CAIEN01,CIDCO01,Ar                                    $>,>,>,>
    Read   UPCA_123456789012                                        B]E00123456789012
    EnterSP
    Send   $cAIEN,cIDCO                                             $>01,>01
    ExitSP

Check that HH can read all barcode when enable tag $AA
    [Tags]      RS232_STD      USB_COM      USB_CPS
    [Setup]     Send   $S,CAIEN01,CIDCO01,AA,Ar        $>,>,>,>,>
    #Description                                                    Expected Result
    Read   UPCA_123456789012                                        F]E00123456789012
    Read   UPCA_AddOn2_12345678901212                               F]E00123456789012
    Read   UPCA_AddOn5_12345678901212345                            F]E00123456789012
    Read   UPCA_Coupon_523456789010                                 F]E00523456789010
    Read   UPCE_02345673                                            F]E00023456000073
    Read   UPCE_AddOn2_0234567389                                   F]E00023456000073
    Read   UPCE_AddOn5_0234567389759                                F]E00023456000073
    Read   EAN8_12345670                                            FF]E412345670
    Read   EAN8_AddOn2_1234567012                                   FF]E412345670
    Read   EAN8_AddOn5_1234567012345                                FF]E412345670
    Read   EAN13_1234567890128                                      F]E01234567890128
    Read   EAN13_AddOn2_123456789012812                             F]E01234567890128
    Read   EAN13_AddOn5_123456789012812345                          F]E01234567890128
    Read   ISBN13_9781234567897                                     F]E09781234567897
    Read   ISBN13_9794567890129                                     F]E09794567890129
    Read   ISBN13_AddOn5_978817525766512345                         F]E09788175257665
    Read   ISSN_9770264359008                                       F]E09770264359008
    Read   ISSN_AddOn2_977123456789812                              F]E09771234567898
    Read   Code39_SW7472                                            *]A0SW7472
    Read   Code39_FullASCII_A12@k)                                  *]A0A12%V+K/I
    Read   Code39CIP(FrenchPharmacode39)                            *]A01234562
    Read   Code39TriOptic_456123                                    $T]XA456123
    Read   GS1DataBar14_0112345678901231                            R4]e00112345678901231
    Read   GS1DataBarTruncated_0112345678901231                     R4]e00112345678901231
    Read   GS1DataBarStacked_0112345678901231                       R4]e00112345678901231
    Read   GS1DataBarStackedOmnidirectional_0112345678901231        R4]e00112345678901231
    Read   GS1DataBarLimited_0112345678901231                       RL]e00112345678901231
    Read   GS1DataBarExpanded_010123456789012313                    RX]e00123456789012313
    Read   GS1DataBarExpandedStacked_010123456789012313             RX]e00123456789012313
    Read   Code128_SEGH#%SG23h                                      |#]C0SEGH#%SG23h
    Read   EANUCC128_SEGH#%SG23f                                    ]C1SEGH#%SG23f
    Read   ISBT128                                                  |#]C0f=%BloodCD12 OR/ #]C0f=ADonaID1234=%BloodCD12\r
    Read   Code93                                                   &]G0HY$AB C/+71
    Read   Code93FullASCII                                          &]G0!%JVS)*14k
    Read   Code11_CK2_1240                                          CE]H11240
    Read   Code32_34567890                                          *]A0B9P91Q
    Read   MSI_453621                                               @]M0453621
    Read   MSI_CK1_4536215                                          @]M04536215
    Read   MSI_CK2_45362159                                         @]M045362159
    Read   Codabar_C23049$B                                         %]F0c23049$b
    Read   QT_ABCCodabar(2Labels)                                  %]F0d4333c\r%]F0c1234d OR/ %]F0d4333c OR/ %]F0c1234d
    Read   Code2of5Interleaved_123457                               i]I0123457
    Read   Discrete2of5_34564678                                    s]S034564678
    Read   Code2of5IATA_0986275650                                  W]R00986275650
    Read   Follett2of5_T0123456                                    O]I1T 0123456
    Read   Code2of5Matrix_08312865                                  g]S008312865
    Read   QT_Interleaved2of5CIPHR                                  e]I19876544
    Read   Code2of5Datalogic_123456                                 s]R0123456
    Read   Code2of5Industrial_12345678                              s]S012345678
    Read   PlesseyBidirectional_123456E000                          a]P0123456E000
    Read   GS1DataBar14_Composite_011234567890123112345678901231234567890123                        R4]e00112345678901231
    Read   GS1DataBarTruncated_Composite_011234567890123112345678901231234567890123                 R4]e00112345678901231
    Read   GS1DataBarStackedOmnidirectional_Composite_011234567890123112345678901231234567890123    R4]e00112345678901231
    Read   GS1DataBarLimited_Composite_011234567890123112345678901231234567890123                   RL]e00112345678901231
    Read   GS1DataBarExpanded_Composite                                                             RX]e00101234567890128
    Read   GS1DataBarExpandedStacked_Composite                                                      RX]e001209201190123
    Read   EAN8_Composite_07894565789456                                                            FF]E407894565
    Read   EAN13_Composite_123456789012812345678901231234567890123                                  F]E01234567890128
    Read   UPCA_Composite_12345678901212345678901231234567890123                                    F]E00123456789012
    Read   UPCE_Composite_01234565HelloABCC-Acompo                                                  F]E00012345000065
    Read   EAN128_CCA1                                                                              ]C1012092011901233
    Read   QT_Telepen                                                                               ^t]B2123456
    Read   PDF417                                                   P]L2BP&#*09k2h4
    Read   MicroPDF417                                              mP]L209*$%)djkl
    Read   MacroPDF417_ABCabc                                       P]L2ABCabc
    Read   Aztec_Akd3^%$3NOLd                                       Az]z0Akd3^%$3NOLd
    Read   DataMatrix_#%Js@%mkASFJ37h3f9JsKS                        Dm]d1#%Js@%mkASFJ37h3f9JsKS
    Read   QT_ChineseVer1                                           $S]h0\\xba\\xba\\xd0\\xc5\\xc2\\xeb\\xb1\\xea\\xd7\\xbc
    Read   QT_ChineseVer4                                           $S]h0\\xba\\xba\\xd0\\xc5\\xc2\\xeb\\xb1\\xea\\xd7\\xbc\\r\\n\\xd6\\xd0\\xb9\\xfa\\xce\\xef\\xc6\\xb7\\xb1\\xe0\\xc2\\xeb\\xd6\\xd0\\xd0\\xc4
    Read   QT_ChineseVer24                                          $S]h0\\xba\\xba\\xd0\\xc5\\xc2\\xeb\\xb1\\xea\\xd7\\xbc\\xd6\\xd0\\xba\\xa2\\xb3\\xce\\xd2\\xaa\\xb9\\xa2\\xcb\\xe6\\xd1\\xad\\xca\\xd6\\xb0\\xed\\xd6\\xee\\xb9\\xd7\\xbb\\xd9\\xcc\\xbe\\xc3\\xe0\\xb1\\xb7\\xd7\\xdc\\xb5\\xf3\\xbb\\xae\\xce\\xef\\xc6\\xb7\\xb1\\xe0\\xc2\\xeb\\xd6\\xd0\\xd0\\xc4\\xb1\\xb0\\xbb\\xd3\\xbe\\xbc\\xb9\\xd2\\xa8\\xb3\\xbf\\xa3\\xd1\\xd6\\xb8\\xb0\\xc4\\xea\\xc1\\xf8\\xb8\\xa3\\xb9\\xdd\\xc8\\xe6\\xca\\xb8\\xb8\\xaf\\xb9\\xdb\\xb4\\xf7\\xbe\\xa9\\xcd\\xf8\\xc2\\xb7\\xb3\\xa9\\xcf\\xeb\\xbf\\xc6\\xbc\\xbc\\xb7\\xa2\\xd5\\xb9\\xd3\\xd0\\xd0\\xb0\\xc1\\xbb\\xa3\\xd6\\xb6\\xc7\\xd7\\xab\\xa3\\xb7\\xc3\\xa7\\xca\\xc8\\xb1\\xd9\\xc8\\xef\\xb3\\xdb\\xcf\\xee\\xbc\\xfd\\xbe\\xd1\\xa8\\xb0\\xc9\\xf9\\xd2\\xc4\\xb9\\xab\\xcb\\xbe\\xd5\\xc5\\xb3\\xc9\\xba\\xa3\\xa1\\xa2\\xd3\\xee\\xbd\\xbf\\xc1\\xd4\\xcc\\xcd\\xbe\\xa8\\xc1\\xe4\\xc7\\xdb\\xb7\\xb2\\xcc\\xba\\xb7\\xaf\\xbf\\xb0\\xd5\\xf5\\xb2\\xc9\\xb0\\xa4\\xd2\\xa7\\xb7\\xae\\xb2\\xae\\xe9\\xaa\\xa1\\xa2\\xbb\\xc6\\xd1\\xe0\\xb1\\xf5\\xa1\\xa2\\xc2\\xde\\xc8\\xbf\\xd0\\xd4\\xb7\\xcc\\xb5\\xb0\\xb3\\xf2\\xd0\\xa8\\xb6\\xa7\\xd4\\xf7\\xcb\\xc9\\xc8\\xd7\\xc5\\xc2\\xd6\\xe1\\xa8\\xb6\r
    Read   Maxicode_ABCabc                                          MC]U0ABCabc
    Read   QRCode_@#JasfkBSK14umjkfJHAn12478nasf                    QR]Q1@#JasfkBSK14umjkfJHAn12478nasf
    Read   MicroQRCode_ABCabc                                       $Q]Q1ABCabc

Check that HH can read all barcode when enable tag $AA_RS232_WN
    [Tags]      RS232_WN
    [Setup]     Send   $S,CAIEN01,CIDCO01,AA,Ar        $>,>,>,>,>
   #Description                                                     Expected Result
    Read   UPCA_123456789012                                        A]E00123456789012
    Read   UPCA_AddOn2_12345678901212                               A]E00123456789012
    Read   UPCA_AddOn5_12345678901212345                            A]E00123456789012
    Read   UPCA_Coupon_523456789010                                 A]E00523456789010
    Read   UPCE_02345673                                            A]E00023456000073
    Read   UPCE_AddOn2_0234567389                                   A]E00023456000073
    Read   UPCE_AddOn5_0234567389759                                A]E00023456000073
    Read   EAN8_12345670                                            B]E412345670
    Read   EAN8_AddOn2_1234567012                                   B]E412345670
    Read   EAN8_AddOn5_1234567012345                                B]E412345670
    Read   EAN13_1234567890128                                      A]E01234567890128
    Read   EAN13_AddOn2_123456789012812                             A]E01234567890128
    Read   EAN13_AddOn5_123456789012812345                          A]E01234567890128
    Read   ISBN13_9781234567897                                     A]E09781234567897
    Read   ISBN13_9794567890129                                     A]E09794567890129
    Read   ISBN13_AddOn5_978817525766512345                         A]E09788175257665
    Read   ISSN_9770264359008                                       A]E09770264359008
    Read   ISSN_AddOn2_977123456789812                              A]E09771234567898
    Read   Code39_SW7472                                            M]A0SW7472
    Read   Code39_FullASCII_A12@k)                                  M]A0A12%V+K/I
    Read   Code39CIP(FrenchPharmacode39)                            M]A01234562
    Read   Code39TriOptic_456123                                    $T]XA456123
    Read   GS1DataBar14_0112345678901231                            E]e00112345678901231
    Read   GS1DataBarTruncated_0112345678901231                     E]e00112345678901231
    Read   GS1DataBarStacked_0112345678901231                       E]e00112345678901231
    Read   GS1DataBarStackedOmnidirectional_0112345678901231        E]e00112345678901231
    Read   GS1DataBarLimited_0112345678901231                       E]e00112345678901231
    Read   GS1DataBarExpanded_010123456789012313                    E]e00123456789012313
    Read   GS1DataBarExpandedStacked_010123456789012313             E]e00123456789012313
    Read   Code128_SEGH#%SG23h                                      K]C0SEGH#%SG23h
    Read   EANUCC128_SEGH#%SG23f                                    P]C1SEGH#%SG23f
    Read   ISBT128                                                  K]C0f=%BloodCD12 OR/ K]C0f=ADonaID1234=%BloodCD12\r
    Read   Code93                                                   L]G0HY$AB C/+71
    Read   Code93FullASCII                                          L]G0!%JVS)*14k
    Read   Code11_CK2_1240                                          CE]H11240
    Read   Code32_34567890                                          J]A0B9P91Q
    Read   MSI_453621                                               O]M0453621
    Read   MSI_CK1_4536215                                          O]M04536215
    Read   MSI_CK2_45362159                                         O]M045362159
    Read   Codabar_C23049$B                                         N]F0c23049$b
    Read   QT_ABCCodabar(2Labels)                                   N]F0d4333c\rN]F0c1234d OR/ N]F0d4333c OR/ N]F0c1234d
    Read   Code2of5Interleaved_123457                               I]I0123457
    Read   Discrete2of5_34564678                                    s]S034564678
    Read   Code2of5IATA_0986275650                                  W]R00986275650
    Read   Follett2of5_T0123456                                     O]I1T 0123456
    Read   Code2of5Matrix_08312865                                  H]S008312865
    Read   QT_Interleaved2of5CIPHR                                  e]I19876544
    Read   Code2of5Datalogic_123456                                 H]R0123456
    Read   Code2of5Industrial_12345678                              H]S012345678
    Read   PlesseyBidirectional_123456E000                          O]P0123456E000
    Read   GS1DataBar14_Composite_011234567890123112345678901231234567890123                        E]e00112345678901231
    Read   GS1DataBarTruncated_Composite_011234567890123112345678901231234567890123                 E]e00112345678901231
    Read   GS1DataBarStackedOmnidirectional_Composite_011234567890123112345678901231234567890123    E]e00112345678901231
    Read   GS1DataBarLimited_Composite_011234567890123112345678901231234567890123                   E]e00112345678901231
    Read   GS1DataBarExpanded_Composite                                                             E]e00101234567890128
    Read   GS1DataBarExpandedStacked_Composite                                                      E]e001209201190123
    Read   EAN8_Composite_07894565789456                                                            B]E407894565
    Read   EAN13_Composite_123456789012812345678901231234567890123                                  A]E01234567890128
    Read   UPCA_Composite_12345678901212345678901231234567890123                                    A]E00123456789012
    Read   UPCE_Composite_01234565HelloABCC-Acompo                                                A]E00012345000065
    Read   EAN128_CCA1                                                                              P]C1012092011901233
    Read   QT_Telepen                                                                               ^t]B2123456
    Read   PDF417                                                   Q]L2BP&#*09k2h4
    Read   MicroPDF417                                              S]L209*$%)djkl
    Read   MacroPDF417_ABCabc                                       Q]L2ABCabc
    Read   Aztec_Akd3^%$3NOLd                                       V]z0Akd3^%$3NOLd
    Read   DataMatrix_#%Js@%mkASFJ37h3f9JsKS                        Dm]d1#%Js@%mkASFJ37h3f9JsKS
    Read   QT_ChineseVer1                                           $S]h0{\xba}{\xba}{\xd0}{\xc5}{\xc2}{\xeb}{\xb1}{\xea}{\xd7}{\xbc}
    Read   QT_ChineseVer4                                           $S]h0{\xba}{\xba}{\xd0}{\xc5}{\xc2}{\xeb}{\xb1}{\xea}{\xd7}{\xbc}\r{\xd6}{\xd0}{\xb9}{\xfa}{\xce}{\xef}{\xc6}{\xb7}{\xb1}{\xe0}{\xc2}{\xeb}{\xd6}{\xd0}{\xd0}{\xc4}
    Read   QT_ChineseVer24                                          $S]h0{\xba}{\xba}{\xd0}{\xc5}{\xc2}{\xeb}{\xb1}{\xea}{\xd7}{\xbc}{\xd6}{\xd0}{\xba}{\xa2}{\xb3}{\xce}{\xd2}{\xaa}{\xb9}{\xa2}{\xcb}{\xe6}{\xd1}{\xad}{\xca}{\xd6}{\xb0}{\xed}{\xd6}{\xee}{\xb9}{\xd7}{\xbb}{\xd9}{\xcc}{\xbe}{\xc3}{\xe0}{\xb1}{\xb7}{\xd7}{\xdc}{\xb5}{\xf3}{\xbb}{\xae}{\xce}{\xef}{\xc6}{\xb7}{\xb1}{\xe0}{\xc2}{\xeb}{\xd6}{\xd0}{\xd0}{\xc4}{\xb1}{\xb0}{\xbb}{\xd3}{\xbe}{\xbc}{\xb9}{\xd2}{\xa8}{\xb3}{\xbf}{\xa3}{\xd1}{\xd6}{\xb8}{\xb0}{\xc4}{\xea}{\xc1}{\xf8}{\xb8}{\xa3}{\xb9}{\xdd}{\xc8}{\xe6}{\xca}{\xb8}{\xb8}{\xaf}{\xb9}{\xdb}{\xb4}{\xf7}{\xbe}{\xa9}{\xcd}{\xf8}{\xc2}{\xb7}{\xb3}{\xa9}{\xcf}{\xeb}{\xbf}{\xc6}{\xbc}{\xbc}{\xb7}{\xa2}{\xd5}{\xb9}{\xd3}{\xd0}{\xd0}{\xb0}{\xc1}{\xbb}{\xa3}{\xd6}{\xb6}{\xc7}{\xd7}{\xab}{\xa3}{\xb7}{\xc4}{\xf2}{\xbb}{\xf9}{\xd6}{\xe4}{\xa3}{\xeb}{\xc5}{\xe7}{\xce}{\xc1}{\xb9}{\xa1}{\xb7}{\xcf}{\xb1}{\xa7}{\xb5}{\xf7}{\xc2}{\xc0}{\xcd}{\xd9}{\xb5}{\xcb}{\xca}{\xc8}{\xb1}{\xd9}{\xc8}{\xef}{\xb3}{\xdb}{\xcf}{\xee}{\xbc}{\xfd}{\xbe}{\xd1}{\xa8}{\xb0}{\xc9}{\xf9}{\xd2}{\xc4}{\xb9}{\xab}{\xcb}{\xbe}{\xd5}{\xc5}{\xb3}{\xc9}{\xba}{\xa3}{\xa1}{\xa2}{\xd3}{\xee}{\xbd}{\xbf}{\xc1}{\xd4}{\xcc}{\xcd}{\xbe}{\xa8}{\xc1}{\xe4}{\xc7}{\xdb}{\xb7}{\xba}{\xcb}{\xe8}{\xb7}{\xaf}{\xbf}{\xb0}{\xd5}{\xf5}{\xb2}{\xc9}{\xb0}{\xa4}{\xd2}{\xa7}{\xb7}{\xae}{\xb2}{\xae}{\xe9}{\xaa}{\xa1}{\xa2}{\xbb}{\xc6}{\xd1}{\xe0}{\xb1}{\xf5}{\xa1}{\xa2}{\xc2}{\xde}{\xc8}{\xbf}{\xc5}{\xde}{\xb7}{\xcc}{\xb5}{\xb0}{\xb3}{\xf2}{\xd0}{\xa8}{\xb6}{\xa7}{\xd4}{\xf7}{\xcb}{\xc7}
    Read   Maxicode_ABCabc                                          T]U0ABCabc
    Read   QRCode_@#JasfkBSK14umjkfJHAn12478nasf                    U]Q1@#JasfkBSK14umjkfJHAn12478nasf
    Read   MicroQRCode_ABCabc                                       $Q]Q1ABCabc

Check that HH can read all barcode when enable tag $AA RS232_OPOS
    [Tags]      RS232_OPOS
    [Setup]     Send   $S,CAIEN01,CIDCO01,AA,Ar        $>,>,>,>,>
   #Description                                                     Expected Result
    Read   UPCA_123456789012                                        B]E00123456789012
    Read   UPCA_AddOn2_12345678901212                               B]E00123456789012
    Read   UPCA_AddOn5_12345678901212345                            B]E00123456789012
    Read   UPCA_Coupon_523456789010                                 B]E00523456789010
    Read   UPCE_02345673                                            B]E00023456000073
    Read   UPCE_AddOn2_0234567389                                   B]E00023456000073
    Read   UPCE_AddOn5_0234567389759                                B]E00023456000073
    Read   EAN8_12345670                                            A]E412345670
    Read   EAN8_AddOn2_1234567012                                   A]E412345670
    Read   EAN8_AddOn5_1234567012345                                A]E412345670
    Read   EAN13_1234567890128                                      B]E01234567890128
    Read   EAN13_AddOn2_123456789012812                             B]E01234567890128
    Read   EAN13_AddOn5_123456789012812345                          B]E01234567890128
    Read   ISBN13_9781234567897                                     B]E09781234567897
    Read   ISBN13_9794567890129                                     B]E09794567890129
    Read   ISBN13_AddOn5_978817525766512345                         B]E09788175257665
    Read   ISSN_9770264359008                                       B]E09770264359008
    Read   ISSN_AddOn2_977123456789812                              B]E09771234567898
    Read   Code39_SW7472                                            V]A0SW7472
    Read   Code39_FullASCII_A12@k)                                  V]A0A12%V+K/I
    Read   Code39CIP(FrenchPharmacode39)                            V]A01234562
    Read   Code39TriOptic_456123                                    $T]XA456123
    Read   GS1DataBar14_0112345678901231                            u]e00112345678901231
    Read   GS1DataBarTruncated_0112345678901231                     u]e00112345678901231
    Read   GS1DataBarStacked_0112345678901231                       u]e00112345678901231
    Read   GS1DataBarStackedOmnidirectional_0112345678901231        u]e00112345678901231
    Read   GS1DataBarLimited_0112345678901231                       v]e00112345678901231
    Read   GS1DataBarExpanded_010123456789012313                    v]e00123456789012313
    Read   GS1DataBarExpandedStacked_010123456789012313             t]e00123456789012313
    Read   Code128_SEGH#%SG23h                                      T]C0SEGH#%SG23h
    Read   EANUCC128_SEGH#%SG23f                                    k]C1SEGH#%SG23f
    Read   ISBT128                                                  T]C0f=%BloodCD12 OR/ T]C0f=ADonaID1234=%BloodCD12\r
    Read   Code93                                                   U]G0HY$AB C/+71
    Read   Code93FullASCII                                          U]G0!%JVS)*14k
    Read   Code11_CK2_1240                                          b]H11240
    Read   Code32_34567890                                          X]A0B9P91Q
    Read   MSI_453621                                               Z]M0453621
    Read   MSI_CK1_4536215                                          Z]M04536215
    Read   MSI_CK2_45362159                                         Z]M045362159
    Read   Codabar_C23049$B                                         R]F0c23049$b
    Read   QT_ABCCodabar(2Labels)                                   R]F0d4333c\rN]F0c1234d OR/ R]F0d4333c OR/ R]F0c1234d
    Read   Code2of5Interleaved_123457                               N]I0123457
    Read   Discrete2of5_34564678                                    s]S034564678
    Read   Code2of5IATA_0986275650                                  W]R00986275650
    Read   Follett2of5_T0123456                                     O]I1T 0123456
    Read   Code2of5Matrix_08312865                                  g]S008312865
    Read   QT_Interleaved2of5CIPHR                                  e]I19876544
    Read   Code2of5Datalogic_123456                                 s]R0123456
    Read   Code2of5Industrial_12345678                              P]S012345678
    Read   PlesseyBidirectional_123456E000                          a]P0123456E000
    Read   GS1DataBar14_Composite_011234567890123112345678901231234567890123                        u]e00112345678901231
    Read   GS1DataBarTruncated_Composite_011234567890123112345678901231234567890123                 u]e00112345678901231
    Read   GS1DataBarStackedOmnidirectional_Composite_011234567890123112345678901231234567890123    u]e00112345678901231
    Read   GS1DataBarLimited_Composite_011234567890123112345678901231234567890123                   v]e00112345678901231
    Read   GS1DataBarExpanded_Composite                                                             t]e00101234567890128
    Read   GS1DataBarExpandedStacked_Composite                                                      t]e001209201190123
    Read   EAN8_Composite_07894565789456                                                            A]E407894565
    Read   EAN13_Composite_123456789012812345678901231234567890123                                  B]E01234567890128
    Read   UPCA_Composite_12345678901212345678901231234567890123                                    B]E00123456789012
    Read   UPCE_Composite_01234565HelloABCC-Acompo                                                  B]E00012345000065
    Read   EAN128_CCA1                                                                              k]C1012092011901233
    Read   QT_Telepen                                                                               ^t]B2123456
    Read   PDF417                                                   r]L2BP&#*09k2h4
    Read   MicroPDF417                                              8]L209*$%)djkl
    Read   MacroPDF417_ABCabc                                       r]L2ABCabc
    Read   Aztec_Akd3^%$3NOLd                                       !]z0Akd3^%$3NOLd
    Read   DataMatrix_#%Js@%mkASFJ37h3f9JsKS                        d]d1#%Js@%mkASFJ37h3f9JsKS
    Read   QT_ChineseVer1                                           $S]h0{\xba}{\xba}{\xd0}{\xc5}{\xc2}{\xeb}{\xb1}{\xea}{\xd7}{\xbc}
    Read   QT_ChineseVer4                                           $S]h0{\xba}{\xba}{\xd0}{\xc5}{\xc2}{\xeb}{\xb1}{\xea}{\xd7}{\xbc}\r{\xd6}{\xd0}{\xb9}{\xfa}{\xce}{\xef}{\xc6}{\xb7}{\xb1}{\xe0}{\xc2}{\xeb}{\xd6}{\xd0}{\xd0}{\xc4}
    Read   QT_ChineseVer24                                          $S]h0{\xba}{\xba}{\xd0}{\xc5}{\xc2}{\xeb}{\xb1}{\xea}{\xd7}{\xbc}{\xd6}{\xd0}{\xba}{\xa2}{\xb3}{\xce}{\xd2}{\xaa}{\xb9}{\xa2}{\xcb}{\xe6}{\xd1}{\xad}{\xca}{\xd6}{\xb0}{\xed}{\xd6}{\xee}{\xb9}{\xd7}{\xbb}{\xd9}{\xcc}{\xbe}{\xc3}{\xe0}{\xb1}{\xb7}{\xd7}{\xdc}{\xb5}{\xf3}{\xbb}{\xae}{\xce}{\xef}{\xc6}{\xb7}{\xb1}{\xe0}{\xc2}{\xeb}{\xd6}{\xd0}{\xd0}{\xc4}{\xb1}{\xb0}{\xbb}{\xd3}{\xbe}{\xbc}{\xb9}{\xd2}{\xa8}{\xb3}{\xbf}{\xa3}{\xd1}{\xd6}{\xb8}{\xb0}{\xc4}{\xea}{\xc1}{\xf8}{\xb8}{\xa3}{\xb9}{\xdd}{\xc8}{\xe6}{\xca}{\xb8}{\xb8}{\xaf}{\xb9}{\xdb}{\xb4}{\xf7}{\xbe}{\xa9}{\xcd}{\xf8}{\xc2}{\xb7}{\xb3}{\xa9}{\xcf}{\xeb}{\xbf}{\xc6}{\xbc}{\xbc}{\xb7}{\xa2}{\xd5}{\xb9}{\xd3}{\xd0}{\xd0}{\xb0}{\xc1}{\xbb}{\xa3}{\xd6}{\xb6}{\xc7}{\xd7}{\xab}{\xa3}{\xb7}{\xc4}{\xf2}{\xbb}{\xf9}{\xd6}{\xe4}{\xa3}{\xeb}{\xc5}{\xe7}{\xce}{\xc1}{\xb9}{\xa1}{\xb7}{\xcf}{\xb1}{\xa7}{\xb5}{\xf7}{\xc2}{\xc0}{\xcd}{\xd9}{\xb5}{\xcb}{\xca}{\xc8}{\xb1}{\xd9}{\xc8}{\xef}{\xb3}{\xdb}{\xcf}{\xee}{\xbc}{\xfd}{\xbe}{\xd1}{\xa8}{\xb0}{\xc9}{\xf9}{\xd2}{\xc4}{\xb9}{\xab}{\xcb}{\xbe}{\xd5}{\xc5}{\xb3}{\xc9}{\xba}{\xa3}{\xa1}{\xa2}{\xd3}{\xee}{\xbd}{\xbf}{\xc1}{\xd4}{\xcc}{\xcd}{\xbe}{\xa8}{\xc1}{\xe4}{\xc7}{\xdb}{\xb7}{\xba}{\xcb}{\xe8}{\xb7}{\xaf}{\xbf}{\xb0}{\xd5}{\xf5}{\xb2}{\xc9}{\xb0}{\xa4}{\xd2}{\xa7}{\xb7}{\xae}{\xb2}{\xae}{\xe9}{\xaa}{\xa1}{\xa2}{\xbb}{\xc6}{\xd1}{\xe0}{\xb1}{\xf5}{\xa1}{\xa2}{\xc2}{\xde}{\xc8}{\xbf}{\xc5}{\xde}{\xb7}{\xcc}{\xb5}{\xb0}{\xb3}{\xf2}{\xd0}{\xa8}{\xb6}{\xa7}{\xd4}{\xf7}{\xcb}{\xc7}
    Read   Maxicode_ABCabc                                          x]U0ABCabc
    Read   QRCode_@#JasfkBSK14umjkfJHAn12478nasf                    y]Q1@#JasfkBSK14umjkfJHAn12478nasf
    Read   MicroQRCode_ABCabc                                       $Q]Q1ABCabc

Check that HH can't read all barcodes when enable $AD tag
    [Tags]      RS232_STD       RS232_WN        RS232_OPOS      USB_COM     USB_CPS
    [Setup]     Send   $S,AD,Ar        $>,>,>
    Read   UPCA_123456789012                                            NoRead
    Read   UPCA_AddOn2_12345678901212                                   NoRead
    Read   UPCA_AddOn5_12345678901212345                                NoRead
    Read   UPCA_Coupon_523456789010                                     NoRead
    Read   UPCE_02345673                                                NoRead
    Read   UPCE_AddOn2_0234567389                                       NoRead
    Read   UPCE_AddOn5_0234567389759                                    NoRead
    Read   EAN8_12345670                                                NoRead
    Read   EAN8_AddOn2_1234567012                                       NoRead
    Read   EAN8_AddOn5_1234567012345                                    NoRead
    Read   EAN13_1234567890128                                          NoRead
    Read   EAN13_AddOn2_123456789012812                                 NoRead
    Read   EAN13_AddOn5_123456789012812345                              NoRead
    Read   ISBN13_9781234567897                                         NoRead
    Read   ISBN13_9794567890129                                         NoRead
    Read   ISBN13_AddOn5_978817525766512345                             NoRead
    Read   ISSN_9770264359008                                           NoRead
    Read   ISSN_AddOn2_977123456789812                                  NoRead
    Read   Code39_SW7472                                                NoRead
    Read   Code39_FullASCII_A12@k)                                      NoRead
    Read   Code39CIP(FrenchPharmacode39)                               NoRead
    Read   Code39TriOptic_456123                                        NoRead
    Read   GS1DataBar14_0112345678901231                                NoRead
    Read   GS1DataBarTruncated_0112345678901231                         NoRead
    Read   GS1DataBarStacked_0112345678901231                           NoRead
    Read   GS1DataBarStackedOmnidirectional_0112345678901231            NoRead
    Read   GS1DataBarLimited_0112345678901231                           NoRead
    Read   GS1DataBarExpanded_010123456789012313                        NoRead
    Read   GS1DataBarExpandedStacked_010123456789012313                 NoRead
    Read   Code128_SEGH#%SG23h                                          NoRead
    Read   EANUCC128_SEGH#%SG23f                                        NoRead
    Read   ISBT128                                                      NoRead
    Read   Code93                                                       NoRead
    Read   Code93FullASCII                                              NoRead
    Read   Code11_CK2_1240                                              NoRead
    Read   Code32_34567890                                              NoRead
    Read   MSI_453621                                                   NoRead
    Read   MSI_CK1_4536215                                              NoRead
    Read   MSI_CK2_45362159                                             NoRead
    Read   Codabar_C23049$B                                             NoRead
    Read   QT_ABCCodabar(2Labels)                                       NoRead
    Read   Code2of5Interleaved_123457                                   NoRead
    Read   Discrete2of5_34564678                                        NoRead
    Read   Code2of5IATA_0986275650                                      NoRead
    Read   Follett2of5_T0123456                                         NoRead
    Read   Code2of5Matrix_08312865                                      NoRead
    Read   QT_Interleaved2of5CIPHR                                      NoRead
    Read   Code2of5Datalogic_123456                                     NoRead
    Read   Code2of5Industrial_12345678                                  NoRead
    Read   PlesseyBidirectional_123456E000                              NoRead
    Read   GS1DataBar14_Composite_011234567890123112345678901231234567890123                                  NoRead
    Read   GS1DataBarTruncated_Composite_011234567890123112345678901231234567890123                           NoRead
    Read   GS1DataBarExpandedStacked_Composite                                                                NoRead
    Read   GS1DataBarStackedOmnidirectional_Composite_011234567890123112345678901231234567890123              NoRead
    Read   GS1DataBarLimited_Composite_011234567890123112345678901231234567890123                             NoRead
    Read   GS1DataBarExpanded_Composite                                                                       NoRead
    Read   GS1DataBarExpandedStacked_Composite                                                                NoRead
    Read   EAN8_Composite_07894565789456                                                                      NoRead
    Read   EAN13_Composite_123456789012812345678901231234567890123                                            NoRead
    Read   UPCA_Composite_12345678901212345678901231234567890123                                              NoRead
    Read   UPCE_Composite_01234565HelloABCC-Acompo                                                            NoRead
    Read   EAN128_CCA1                                                  NoRead
    Read   QT_Telepen                                                   NoRead
    Read   PDF417                                                       NoRead
    Read   MicroPDF417                                                  NoRead
    Read   MacroPDF417_ABCabc                                           NoRead
    Read   Aztec_Akd3^%$3NOLd                                           NoRead
    Read   DataMatrix_#%Js@%mkASFJ37h3f9JsKS                            NoRead
    Read   QT_ChineseVer1                                               NoRead
    Read   QT_ChineseVer4                                               NoRead
    Read   QT_ChineseVer24                                              NoRead
    Read   Maxicode_ABCabc                                              NoRead
    Read   QRCode_@#JasfkBSK14umjkfJHAn12478nasf                        NoRead
    Read   MicroQRCode_ABCabc                                           NoRead

Check difference between $As and $AS 1
    [Documentation]  	Command $As only save config to user configuration, will lost when we restore interface.
    [Tags]      RS232_STD       USB_COM     USB_CPS     Debug
    [Setup]     Send   $S,AE,Interface,CSNRM03,Ar       $>,>,>,>,>
    EnterSP
    Send   $cC9EN,cC8EN                                 $>00,>01
    Send   $CC9EN01,CC8EN00,As                          $>,>,>
    ExitSP
    Send   R
    Read   Code93_ABCDEF                                ABCDEF
    Read   Code128_ABCabc                               NoRead
    Send   $S,HA00,CSNRM03,Ar                           $>,>,>,>
    Read   Code93_ABCDEF                                NoRead
    Read   Code128_ABCabc                               ABCabc

Check difference between $AS and $As 2
    [Documentation]  	Command $AS only save config to factory configuration, will not lost when we restore interface.
    [Tags]      RS232_STD       USB_COM     USB_CPS     Debug
    [Setup]     Send   $S,AE,Interface,CSNRM03,Ar       $>,>,>,>,>
    EnterSP
    Send   $cC9EN,cC8EN                                 $>00,>01
    Send   $CC9EN01,CC8EN00,AS                          $>,>,>
    ExitSP
    Read   Code93_ABCDEF                                NoRead
    Read   Code128_ABCabc                               ABCabc
    Send   R
    Read   Code93_ABCDEF                                NoRead
    Read   Code128_ABCabc                               ABCabc
    [Teardown]      Send         $S,CSNRM03,Ar          $>,>,>

Check difference between $As and $AS 1
    [Documentation]  	Command $As only save config to user configuration, will lost when we restore interface.
    [Tags]      RS232_WN
    [Setup]     Send   $S,AE,HA12,CSNRM03,Ar       $>,>,>,>,>
    EnterSP
    Send   $cC9EN,cC8EN                                 $>00,>01
    Send   $CC9EN01,CC8EN00,As                          $>,>,>
    ExitSP
    Send   R
    Read   Code93_ABCDEF                                LABCDEF
    Read   Code128_ABCabc                               NoRead
    Send   $S,HA00,CSNRM03,Ar                           $>,>,>,>
    Read   Code93_ABCDEF                                NoRead
    Read   Code128_ABCabc                               KABCabc

Check difference between $AS and $As 2
    [Documentation]  	Command $AS only save config to factory configuration, will not lost when we restore interface.
    [Tags]      RS232_WN
    [Setup]     Send   $S,AE,HA12,CSNRM03,Ar       $>,>,>,>,>
    EnterSP
    Send   $cC9EN,cC8EN                                 $>00,>01
    Send   $CC9EN01,CC8EN00,AS                          $>,>,>
    ExitSP
    Read   Code93_ABCDEF                                NoRead
    Read   Code128_ABCabc                               KABCabc
    Send   R
    Read   Code93_ABCDEF                                NoRead
    Read   Code128_ABCabc                               KABCabc
    [Teardown]      Send         $S,CSNRM03,Ar          $>,>,>

Check difference between $As and $AS 1
    [Documentation]  	Command $As only save config to user configuration, will lost when we restore interface.
    [Tags]      RS232_OPOS
    [Setup]     Send   $S,AE,HA13,CSNRM03,Ar       $>,>,>,>,>
    EnterSP
    Send   $cC9EN,cC8EN                                 $>00,>01
    Send   $CC9EN01,CC8EN00,As                          $>,>,>
    ExitSP
    Send   R
    Read   Code93_ABCDEF                                UABCDEF
    Read   Code128_ABCabc                               NoRead
    Send   $S,HA00,CSNRM03,Ar                           $>,>,>,>
    Read   Code93_ABCDEF                                NoRead
    Read   Code128_ABCabc                               TABCabc

Check difference between $AS and $As 2
    [Documentation]  	Command $AS only save config to factory configuration, will not lost when we restore interface.
    [Tags]      RS232_OPOS
    [Setup]     Send   $S,AE,HA13,CSNRM03,Ar       $>,>,>,>,>
    EnterSP
    Send   $cC9EN,cC8EN                                 $>00,>01
    Send   $CC9EN01,CC8EN00,AS                          $>,>,>
    ExitSP
    Read   Code93_ABCDEF                                NoRead
    Read   Code128_ABCabc                               TABCabc
    Send   R
    Read   Code93_ABCDEF                                NoRead
    Read   Code128_ABCabc                               TABCabc
    [Teardown]      Send         $S,CSNRM03,Ar          $>,>,>