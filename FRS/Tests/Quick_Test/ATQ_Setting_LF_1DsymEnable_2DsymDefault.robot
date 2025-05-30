*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}


*** Variables ***
${current_directory}         ${data_source}\\Quick_Test
*** test cases ***
ATQ_Setting_LF_1DsymEnable_2DsymDefault
    [Documentation]  Verify that SUT can decodes all 1D & 2D default enabled symbologies correctly when:
    ...  -	Enable all of 1D syms & label formatting:
    ...  o	AIM ID & Label ID
    ...  o	Prefix & Suffix
    ...  o	Case Conversion & Character Conversion
    ...  -	Set label ID different with default.
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                   Expected result
    EnterSP			$>
    Send  $CADOT1E			$>
    Send  $CIDCO02			$>
    Send  $CAIEN01			$>
    Send  $CLFPR61415F0000000000000000000000000000000000			$>
    Send  $CLFSU5F5A7A0D00000000000000000000000000000000			$>
    Send  $CLFCA02			$>
    Send  $CLFCH3141324200000000			$>
    Send  $CABEN01			$>
    Send  $CEBEN01			$>
    Send  $C8BEN01			$>
    Send  $C3BEN01			$>
    Send  $C3BIN01			$>
    Send  $C3BIS01			$>
    Send  $C4BEN01			$>
    Send  $CLBEN01			$>
    Send  $CXBEN01			$>
    Send  $CC3EN01			$>
    Send  $CCCEN01			$>
    Send  $CC3CT01			$>
    Send  $CC3FA01			$>
    Send  $CCTEN01			$>
    Send  $CI8CE01			$>
    Send  $CI8L00102		$>
    Send  $CC9EN01			$>
    Send  $CC8EN01			$>
    Send  $CU8EN01			$>
    Send  $CI2EN01			$>
    Send  $CU2EN01			$>
    Send  $CS2EN01			$>
    Send  $CIAEN01			$>
    Send  $CF2EN01			$>
    Send  $CM2EN01			$>
    Send  $CCHEN01			$>
    Send  $CD2EN01			$>
    Send  $CPLEN01			$>
    Send  $CMSEN01			$>
    Send  $CCBEN01			$>
    Send  $CCBAB01			$>
    Send  $CC1EN01			$>
    Send  $CP3EN01			$>
    Send  $C4B2D01			$>
    Send  $CLB2D01			$>
    Send  $CXB2D01			$>
    Send  $CU82D01			$>
    Send  $CEB2D01			$>
    Send  $CAB2D01			$>
    Send  $C8B2D01			$>
    Send  $C3B2D01			$>
    Send  $CADO201			$>
    Send  $CADO501			$>
    Send  $CCPCL00			$>
    Send  $C4CID630000			$>
    Send  $CXCID640000			$>
    Send  $CLCID690000			$>
    Send  $CABID430000			$>
    Send  $CEBID440000			$>
    Send  $C8BID410000			$>
    Send  $C3BID420000			$>
    Send  $CISID400000			$>
    Send  $CINID406E00			$>
    Send  $CC3ID560000			$>
    Send  $CCCID565900			$>
    Send  $CCTID562454			$>
    Send  $CP3ID580000			$>
    Send  $CI2ID4E0000			$>
    Send  $CS2ID500000			$>
    Send  $CIAID260000			$>
    Send  $CF2ID4F3200			$>
    Send  $CM2ID673200			$>
    Send  $CU2ID573200			$>
    Send  $CCBID520000			$>
    Send  $CACID534100			$>
    Send  $CC9ID550000			$>
    Send  $CC1ID620000			$>
    Send  $CPLID614200			$>
    Send  $CC8ID540000			$>
    Send  $CU8ID6B0000			$>
    Send  $CI8ID663800			$>
    Send  $CMSID5A0000			$>
    Send  $CA2ID460000			$>
    Send  $CA5ID470000			$>
    Send  $CE2ID480000			$>
    Send  $CE5ID490000			$>
    Send  $C82ID4A0000			$>
    Send  $C85ID4B0000			$>
    Send  $C32ID4C0000			$>
    Send  $C35ID4D0000			$>
    Send  $C3MID244600			$>
    Send  $C8MID244700			$>
    Send  $CAMID244800			$>
    Send  $CEMID244900			$>
    Send  $CUMID244A00			$>
    Send  $C4BID750000			$>
    Send  $CXBID740000			$>
    Send  $CLBID760000			$>
    Send  $CAZID210000			$>
    Send  $CDMID770000			$>
    Send  $CQRID790000			$>
    Send  $CMQID4D7900			$>
    Send  $CMXID780000			$>
    Send  $CP4ID720000			$>
    Send  $CMIID380000			$>
    Send  $CCSID245343			$>
    Send  $Ar			        $>
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
    Read  Code39TriOptic_456123					            aA_]XA456AB3V$T_Zz
ATQ_Setting_LF_1DsymEnable_2DsymDefault_GS1DataBar
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  GS1DataBar14_0112345678901231					    aA_]e00AAB34567890AB3Au_Zz
    Read  GS1DataBarTruncated_0112345678901231					            aA_]e00AAB34567890AB3Au_Zz
    Read  GS1DataBarStacked_0112345678901231					            aA_]e00AAB34567890AB3Au_Zz
    Read  GS1DataBarStackedOmnidirectional_0112345678901231					aA_]e00AAB34567890AB3Au_Zz
    Read  GS1DataBarLimited_0112345678901231					            aA_]e00AAB34567890AB3Av_Zz
    Read  GS1DataBarExpanded_010123456789012313					            aA_]e00AB34567890AB3A3t_Zz
    Read  GS1DataBarExpandedStacked_010123456789012313					    aA_]e00AB34567890AB3A3t_Zz
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
    Read  Code93					                                        aA_]G0hy$ab c/+7AU_Zz
    Read  Code93FullASCII					                                aA_]G0!%jvs)*A4kU_Zz
ATQ_Setting_LF_1DsymEnable_2DsymDefault_Code11
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  Code11_CK2_1240					                aA_]H1AB40b_Zz
ATQ_Setting_LF_1DsymEnable_2DsymDefault_Code32
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  Code32_34567890					                aA_]A134567890X_Zz
ATQ_Setting_LF_1DsymEnable_2DsymDefault_MSI
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  MSI_453621					                    aA_]M04536BAZ_Zz
    Read  MSI_CK1_4536215					                aA_]M04536BA5Z_Zz
    Read  MSI_CK2_45362159					                aA_]M04536BA59Z_Zz
ATQ_Setting_LF_1DsymEnable_2DsymDefault_Codabar
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  Codabar_C23049$B					                aA_]F0cB3049$bR_Zz
    Read  QT_ABCCodabar(2Labels)					        aA_]F1cAB344333cSA_Zz
ATQ_Setting_LF_1DsymEnable_2DsymDefault_Code2of5
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  Code2of5Interleaved_123457					    aA_]I0AB3457N_Zz
    Read  Code2of5Industrial_12345678					    aA_]S0AB345678P_Zz
    Read  Discrete2of5_34564678					            aA_]S034564678P_Zz
    Read  Code2of5IATA_123412345678903					    aA_]R1AB34AB345678903&_Zz
    Read  Follett2of5_T0123456					            aA_]I1t 0AB3456O2_Zz
    Read  Code2of5Matrix_08312865					        aA_]S0083AB865g2_Zz
    Read  QT_Interleaved2of5CIPHR   					    aA_]I19876544e_Zz
    Read  Code2of5IATA_0986275650					        aA_]R0B4689753s_Zz
ATQ_Setting_LF_1DsymEnable_2DsymDefault_Plessey
    [Documentation]  Verify that SUT can decodes all 1D & 2D symbologies correctly with below scenario:
    ...   DC_2Dsyms:	         Label ID Default as Prefix + Syms (All Default 1D + 2D enable)
    [Tags]      RS232_STD    USB_COM   USB_CPS
    # Description                                        Expected result
    Read  PlesseyBidirectional_123456E000					aA_]P0AB3456e000aB_Zz
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
    Read  MicroPDF417                                                               ${EMPTY}
    Read  MacroPDF417_ABCabc					                                    aA_]L2abcabcr_Zz
    Read  Aztec_Akd3^%$3NOLd                                                        aA_]z0akd3^%$3nold!_Zz
    Read  DataMatrix_#%Js@%mkASFJ37h3f9JsKS					                        aA_]d1#%js@%mkasfj37h3f9jsksw_Zz
    Read  QT_ChineseVer1                                                          ${EMPTY}
    Read  QT_ChineseVer4                                                          ${EMPTY}
    Read  QT_ChineseVer24                                                         ${EMPTY}
    Read  Maxicode_ABCabc                                                           ${EMPTY}
    Read  QRCode_@#JasfkBSK14umjkfJHAn12478nasf					                    aA_]Q1@#jasfkbskA4umjkfjhanAB478nasfy_Zz
    Read  MicroQRCode_ABCabc                                                        ${EMPTY}
