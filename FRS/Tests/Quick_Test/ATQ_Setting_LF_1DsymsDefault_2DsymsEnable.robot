*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}


*** Variables ***
${current_directory}         ${data_source}\\Quick_Test
*** test cases ***
ATQ_Setting_LF_1DsymEnable_2DsymDefault
    [Documentation]  Verify that SUT can decodes 1D default & 2D enabled symbologies correctly when:
    ...  -	Enable all of 2D syms & label formatting:
    ...  o	AIM ID & Label ID
    ...  o	Prefix & Suffix
    ...  o	Case Conversion & Character Conversion
    ...  -	Set label ID different with default
    ...  LF_2Dsyms:      Global Prefix + AIM ID + Syms (All 2D, default 1D enable) + Label ID (Not Default) + Global Suffix.
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                   Expected result
    EnterSP	                                            $>
    Send  $CIDCO02		                                            $>
    Send  $CAIEN01		                                            $>
    Send  $CAZEN01		                                            $>
    Send  $CDMEN01		                                            $>
    Send  $CQREN01		                                            $>
    Send  $CMQEN01		                                            $>
    Send  $CMXEN01		                                            $>
    Send  $CP4EN01		                                            $>
    Send  $CMIEN01		                                            $>
    Send  $CDESA01		                                            $>
    Send  $CCSEN01		                                            $>
    Send  $CLFPR61415F0000000000000000000000000000000000	        $>
    Send  $CLFSU5F5A7A0D00000000000000000000000000000000	        $>
    Send  $CLFCA02		                                            $>
    Send  $CLFCH3141324200000000		                                            $>
    Send  $C4CID630000		                                            $>
    Send  $CXCID640000		                                            $>
    Send  $CLCID690000		                                            $>
    Send  $CABID430000		                                            $>
    Send  $CEBID440000		                                            $>
    Send  $C8BID410000		                                            $>
    Send  $C3BID420000		                                            $>
    Send  $CISID400000		                                            $>
    Send  $CINID406E00		                                            $>
    Send  $CC3ID560000		                                            $>
    Send  $CCCID565900		                                            $>
    Send  $CCTID562454		                                            $>
    Send  $CP3ID580000		                                            $>
    Send  $CI2ID4E0000		                                            $>
    Send  $CS2ID500000		                                            $>
    Send  $CIAID260000		                                            $>
    Send  $CF2ID4F3200		                                            $>
    Send  $CM2ID673200		                                            $>
    Send  $CU2ID573200		                                            $>
    Send  $CCBID520000		                                            $>
    Send  $CACID534100		                                            $>
    Send  $CC9ID550000		                                            $>
    Send  $CC1ID620000		                                            $>
    Send  $CPLID614200		                                            $>
    Send  $CC8ID540000		                                            $>
    Send  $CU8ID6B0000		                                            $>
    Send  $CI8ID663800		                                            $>
    Send  $CMSID5A0000		                                            $>
    Send  $CA2ID460000		                                            $>
    Send  $CA5ID470000		                                            $>
    Send  $CE2ID480000		                                            $>
    Send  $CE5ID490000		                                            $>
    Send  $C82ID4A0000		                                            $>
    Send  $C85ID4B0000		                                            $>
    Send  $C32ID4C0000		                                            $>
    Send  $C35ID4D0000		                                            $>
    Send  $C3MID244600		                                            $>
    Send  $C8MID244700		                                            $>
    Send  $CAMID244800		                                            $>
    Send  $CEMID244900		                                            $>
    Send  $CUMID244A00		                                            $>
    Send  $C4BID750000		                                            $>
    Send  $CXBID740000		                                            $>
    Send  $CLBID760000		                                            $>
    Send  $CAZID210000		                                            $>
    Send  $CDMID770000		                                            $>
    Send  $CQRID790000		                                            $>
    Send  $CMQID4D7900		                                            $>
    Send  $CMXID780000		                                            $>
    Send  $CP4ID720000		                                            $>
    Send  $CMIID380000		                                            $>
    Send  $CCSID245343		                                            $>
    Send  $Ar	                                                        $>
ATQ_Setting_LF_1DsymEnable_2DsymDefault_UPCA
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  UPCA_123456789012					                aA_]E00AB34567890ABB_Zz
    Read  UPCA_AddOn2_12345678901212					    aA_]E30AB34567890ABABL_Zz
    Read  UPCA_AddOn5_12345678901212345					    aA_]E30AB34567890ABAB345M_Zz
    Read  UPCA_Coupon_523456789010					        aA_]E005B34567890A0B_Zz
ATQ_Setting_LF_1DsymEnable_2DsymDefault_UPCE
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  UPCE_02345673					                    aA_]E000B3456000073B_Zz
    Read  UPCE_AddOn2_0234567389					        aA_]E300B345600007389L_Zz
    Read  UPCE_AddOn5_0234567389759					        aA_]E300B345600007389759M_Zz
ATQ_Setting_LF_1DsymEnable_2DsymDefault_EAN8
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  EAN8_12345670					                    aA_]E4AB345670A_Zz
    Read  EAN8_AddOn2_1234567012					        aA_]E4AB345670]E1ABJ_Zz
    Read  EAN8_AddOn5_1234567012345					        aA_]E4AB345670]E2AB345K_Zz
ATQ_Setting_LF_1DsymEnable_2DsymDefault_EAN13
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  EAN13_1234567890128					            aA_]E0AB34567890AB8B_Zz
    Read  EAN13_AddOn2_123456789012812					    aA_]E3AB34567890AB8ABL_Zz
    Read  EAN13_AddOn5_123456789012812345					aA_]E3AB34567890AB8AB345M_Zz
    Read  ISBN13_9781234567897					            aA_]E0AB3456789x@_Zz
    Read  ISBN13_9794567890129					            aA_]E04567890AB4@_Zz
    Read  ISBN13_AddOn5_978817525766512345					aA_]E38A75B57660AB345@_Zz
    Read  ISSN_9770264359008					            aA_]E00B643596@n_Zz
    Read  ISSN_AddOn2_977123456789812					    aA_]E3AB345679AB@n_Zz
ATQ_Setting_LF_1DsymEnable_2DsymDefault_Code39
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  Code39_SW7472					                    aA_]A0sw747BV_Zz
    Read  Code39_FullASCII_A12@k)					        aA_]A4aAB@k)V_Zz
    Read  Code39CIP_1234562					                aA_]A1AB3456BVY_Zz
    Read  Code39TriOptic_456123
ATQ_Setting_LF_1DsymEnable_2DsymDefault_GS1DataBar
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  GS1DataBar14_0112345678901231
    Read  GS1DataBarTruncated_0112345678901231
    Read  GS1DataBarStacked_0112345678901231
    Read  GS1DataBarStackedOmnidirectional_0112345678901231
    Read  GS1DataBarLimited_0112345678901231
    Read  GS1DataBarExpanded_010123456789012313
    Read  GS1DataBarExpandedStacked_010123456789012313
ATQ_Setting_LF_1DsymEnable_2DsymDefault_Code128
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  Code128_SEGH#%SG23h					                            aA_]C0segh#%sgB3hT_Zz
    Read  EANUCC128_SEGH#%SG23f					                            aA_]C1segh#%sgB3fk_Zz
    Read  ISBT128					                                        aA_]C4=adonaidAB34=%bloodcdABf8_Zz
ATQ_Setting_LF_1DsymEnable_2DsymDefault_Code93
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  Code93
    Read  Code93FullASCII
ATQ_Setting_LF_1DsymEnable_2DsymDefault_Code11
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  Code11_CK2_1240
ATQ_Setting_LF_1DsymEnable_2DsymDefault_Code32
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  Code32_34567890
ATQ_Setting_LF_1DsymEnable_2DsymDefault_MSI
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  MSI_453621
    Read  MSI_CK1_4536215
    Read  MSI_CK2_45362159
ATQ_Setting_LF_1DsymEnable_2DsymDefault_Codabar
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  Codabar_C23049$B
    Read  QT_ABCCodabar(2Labels)
ATQ_Setting_LF_1DsymEnable_2DsymDefault_Code2of5
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  Code2of5Interleaved_123457
    Read  Code2of5Industrial_12345678
    Read  Discrete2of5_34564678
    Read  Code2of5IATA_123412345678903
    Read  Follett2of5_T0123456
    Read  Code2of5Matrix_08312865
    Read  QT_Interleaved2of5CIPHR
    Read  Code2of5IATA_0986275650
ATQ_Setting_LF_1DsymEnable_2DsymDefault_Plessey
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  PlesseyBidirectional_123456E000
ATQ_Setting_LF_1DsymEnable_2DsymDefault_Composite
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  GS1DataBar14_Composite_011234567890123112345678901231234567890123					        aA_]e00AAB34567890AB3A]e0AB34567890AB3AB34567890AB3c_Zz
    Read  GS1DataBarTruncated_Composite_011234567890123112345678901231234567890123					aA_]e00AAB34567890AB3A]e0AB34567890AB3AB34567890AB3c_Zz
    Read  GS1DataBarStacked_Composite_011234567890123112345678901231234567890123					aA_]e00AAB34567890AB3A]e0AB34567890AB3AB34567890AB3c_Zz
    Read  GS1DataBarStackedOmnidirectional_Composite_011234567890123112345678901231234567890123					aA_]e00AAB34567890AB3A]e0AB34567890AB3AB34567890AB3c_Zz
    Read  GS1DataBarLimited_Composite_011234567890123112345678901231234567890123					aA_]e00AAB34567890AB3A]e0AB34567890AB3AB34567890AB3i_Zz
    Read  GS1DataBarExpanded_Composite					    aA_]e00A0AB34567890AB8]e0BA4B349B8347B9874B3d_Zz
    Read  GS1DataBarExpandedStacked_Composite				aA_]e00AB09B0AA90AB3A9]e0789456d_Zz
    Read  EAN128_CCA1					                    aA_]C10AB09B0AA90AB33]e0789456$J_Zz
    Read  EAN8_Composite_07894565789456					    aA_]E407894565]e0789456$G_Zz OR/ aA_]E407894565A_Zz
    Read  EAN13_Composite_123456789012812345678901231234567890123					aA_]E0AB34567890AB8]e0AB34567890AB3AB34567890AB3$F_Zz OR/ aA_]E0AB34567890AB8B_Zz
    Read  UPCA_Composite_12345678901212345678901231234567890123					    aA_]E0AB34567890AB]e0AB34567890AB3AB34567890AB3$H_Zz OR/ aA_]E00AB34567890ABB_Zz
    Read  UPCE_Composite_01234565HelloABCC-Acompo					                aA_]E00AB34565]e0helloab cc-a compo$I_Zz OR/ aA_]E000AB345000065B_Zz
    Read  EAN128_CCA2					                                            aA_]C10AB09B0AA90AB33]e0abcde$J_Zz
ATQ_Setting_LF_1DsymEnable_2DsymDefault
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  PDF417					                                                aA_]L2bp&#*09kBh4r_Zz
    Read  MicroPDF417                                                               aA_]L209*$%)djkl8_Zz
    Read  MacroPDF417_ABCabc					                                    aA_]L2abcabcr_Zz
    Read  Aztec_Akd3^%$3NOLd                                                        aA_]z0akd3^%$3nold!_Zz
    Read  DataMatrix_#%Js@%mkASFJ37h3f9JsKS					                        aA_]d1#%js@%mkasfj37h3f9jsksw_Zz
    Read   QT_ChineseVer1                                       $S\\xba\\xba\\xd0\\xc5\\xc2\\xeb\\xb1\\xea\\xd7\\xbc
    Read   QT_ChineseVer4                                       $S\\xba\\xba\\xd0\\xc5\\xc2\\xeb\\xb1\\xea\\xd7\\xbc\r\\xd6\\xd0\\xb9\\xfa\\xce\\xef\\xc6\\xb7\\xb1\\xe0\\xc2\\xeb\\xd6\\xd0\\xd0\\xc4
    Read   QT_ChineseVer24                                      $S\\xba\\xba\\xd0\\xc5\\xc2\\xeb\\xb1\\xea\\xd7\\xbc\\xd6\\xd0\\xba\\xa2\\xb3\\xce\\xd2\\xaa\\xb9\\xa2\\xcb\\xe6\\xd1\\xad\\xca\\xd6\\xb0\\xed\\xd6\\xee\\xb9\\xd7\\xbb\\xd9\\xcc\\xbe\\xc3\\xe0\\xb1\\xb7\\xd7\\xdc\\xb5\\xf3\\xbb\\xae\\xce\\xef\\xc6\\xb7\\xb1\\xe0\\xc2\\xeb\\xd6\\xd0\\xd0\\xc4\\xb1\\xb0\\xbb\\xd3\\xbe\\xbc\\xb9\\xd2\\xa8\\xb3\\xbf\\xa3\\xd1\\xd6\\xb8\\xb0\\xc4\\xea\\xc1\\xf8\\xb8\\xa3\\xb9\\xdd\\xc8\\xe6\\xca\\xb8\\xb8\\xaf\\xb9\\xdb\\xb4\\xf7\\xbe\\xa9\\xcd\\xf8\\xc2\\xb7\\xb3\\xa9\\xcf\\xeb\\xbf\\xc6\\xbc\\xbc\\xb7\\xa2\\xd5\\xb9\\xd3\\xd0\\xd0\\xb0\\xc1\\xbb\\xa3\\xd6\\xb6\\xc7\\xd7\\xab\\xa3\\xb7\\xc3\\xa7\\xca\\xc8\\xb1\\xd9\\xc8\\xef\\xb3\\xdb\\xcf\\xee\\xbc\\xfd\\xbe\\xd1\\xa8\\xb0\\xc9\\xf9\\xd2\\xc4\\xb9\\xab\\xcb\\xbe\\xd5\\xc5\\xb3\\xc9\\xba\\xa3\\xa1\\xa2\\xd3\\xee\\xbd\\xbf\\xc1\\xd4\\xcc\\xcd\\xbe\\xa8\\xc1\\xe4\\xc7\\xdb\\xb7\\xb2\\xcc\\xba\\xb7\\xaf\\xbf\\xb0\\xd5\\xf5\\xb2\\xc9\\xb0\\xa4\\xd2\\xa7\\xb7\\xae\\xb2\\xae\\xe9\\xaa\\xa1\\xa2\\xbb\\xc6\\xd1\\xe0\\xb1\\xf5\\xa1\\xa2\\xc2\\xde\\xc8\\xbf\\xd0\\xd4\\xb7\\xcc\\xb5\\xb0\\xb3\\xf2\\xd0\\xa8\\xb6\\xa7\\xd4\\xf7\\xcb\\xc9\\xc8\\xd7\\xc5\\xc2\\xd6\\xe1\\xa8\\xb6\r
    Read   DataMatrix_#%Js@%mkASFJ37h3f9JsKS	                Dm#%Js@%mkASFJ37h3f9JsKS
    Read   Maxicode_#%ake3f9JsLHAN                              aA_]U0#%ake3f9jslhanx_Zz
    Read   QRCode_@#JasfkBSK14umjkfJHAn12478nasf	            aA_]Q1@#jasfkbskA4umjkfjhanAB478nasfy_Zz
    Read   MicroQRCode_08aSFJk@%$kAK	                        aA_]Q108asfjk@%$kakMy_Zz