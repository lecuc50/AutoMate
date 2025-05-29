*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}


*** Variables ***
${current_directory}         ${data_source}\\Quick_Test
*** test cases ***
Verify default of tag OCEN is disabled
    [Documentation]  Check OCEN tag and combination of this tag. Also check label ID of each font.
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                       Expected result
    EnterSP			                            $>
    Send  $cOCEN			                    $>00000000
    ExitSP			                            $>
    Read  OCRB_Passport_Original Label          ${EMPTY}
    Read  OCRB_Postal_451_9_1                   ${EMPTY}
    Read  OCRB_Postal_674_1.1.9.1_1             ${EMPTY}
Verify customer index setting in service port mode
    [Documentation]  Check OCEN tag and combination of this tag. Also check label ID of each font.
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                                           Expected result
    Send  $S,COCEN10000000,G0141414141414141414141414141410D0D,Ar			$>,>,>,>
    EnterSP			                                                        $>
    Send  $g01			                                                    $>41414141414141414141414141410D0D
    ExitSP			                                                        $>
    Send  $S,COCEN20000000,G0241414141414141414141414141410D0D,Ar			$>,>,>,>
    EnterSP			                                                        $>
    Send  $g02			                                                    $>41414141414141414141414141410D0D
    ExitSP			                                                        $>
    Send  $S,COCEN40000000,G0341414141414141414141414141410D0D,Ar			$>,>,>,>
    EnterSP			                                                        $>
    Send  $g03			                                                    $>41414141414141414141414141410D0D
    ExitSP			                                                        $>
    Send  $S,COCEN80000000,G0441414141414141414141414141410D0D,Ar			$>,>,>,>
    EnterSP			                                                        $>
    Send  $g04			                                                    $>41414141414141414141414141410D0D
    ExitSP			                                                        $>
Verify can read EU Identify card
    [Documentation]  Check OCEN tag and combination of this tag. Also check label ID of each font.
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                                           Expected result
    Send  $S,COCEN00000001,Ar			                                    $>,>,>
    Read  EUIdentifyCard_MADRID			                                    have no data
    Read  EU Identify card_TESTV			                                IDCHE1234567897<<<<<<<<<<<<<<<\r\n6605083F2404200ITA<<<<<<<<<<<8\r\nABCDEFGHIJK<<LMNOPQRST<UVWXYZ<
    Read  EU Identify card_LiestalBL			                            IDCHEE1491644<7<<<<<<<<<<<<<<<\r\n6911133M2305020CHE<<<<<<<<<<<8\r\nSALATHE<<MARC<<<<<<<<<<<<<<<<<
    Read  EU Identify card_BaselStadtBS			                            IDCHEC8391896<6<<<<<<<<<<<<<<<\r\n5406087M2603173CHE<<<<<<<<<<<0\r\nVORDERMANN<<GILBERT<LUCIEN<<<<
    Read  EU Identify card_LiestalBL_2			                            IDCHEE3351460<4<<<<<<<<<<<<<<<\r\n6006303M2711014CHE<<<<<<<<<<<2\r\nBAUMGARTNER<<CHRISTOPH<DANIEL<
    Read  EU Identify card_Organce			                                have no data
Verify can read OCRB_Passport
    [Documentation]  Check OCEN tag and combination of this tag. Also check label ID of each font.
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                                           Expected result
    Send  $S,COCEN00000002,Ar			                                    $>,>,>
    Read  OCRB_Passport_Label1			                                    PPATAIJLHFHTNMW<<ODQCPGRSBU<<<<<<<<<<<<<<<<<\r\nBPBPRBDRD5ATA8811259M2008309UQDKHLFIWVLLIZ68
    Read  OCRB_Passport_Original Label			                            P<GRCELLINAS<<GEORGIOS<<<<<<<<<<<<<<<<<<<<<<\r\nAE00000057GRC6504049M1208283<<<<<<<<<<<<<<00
    Read  OCRB_Passport_Label2			PQCCKYVYVXZXZIK<<LTLTIILLLL<<<<<<<<<<<<<<<<<\r\nOPUDBIJIL3CCK4408305F2206208LLIIFHINNYZXNM70
    Read  OCRB_Passport_Label3			P<HARG896GDOQCPR<<KFKFLVXVXV<66P9KK442K<<<<<\r\n089DB1J2L8ARG4408305F2206208LLI1F8IN36ZX7M18
    Read  OCRB_Passport_Label4			PRBOLSBSBRRSSPP<<KXKXKX77XK<<UOUONM11NM<<<<<\r\nUA633KLIG3BOL8904159M25102841OFCCSSF58Z17M30
    Read  OCRB_Passport_Label5			PGBWA1717447744<<8899666969<<<<<<<<<<<<<<<<<\r\n3336565997BWA8905178M25122991759562144383886
    Read  OCRB_Passport_Label6			PKCOD5565653382<<1412561441<<<<<<<<<<<<<<<<<\r\n3996637113COD9203181F24102031442256358741288
    Read  OCRB_Passport_VN			    P<VNMNGUYEN<<PHUONG<THAO<<<<<<<<<<<<<<<<<<<<\r\nB3080919<5VNM8408233M1905065311746931<<<<<56
    Read  OCRB_Passport_Italian			have no data
    Read  OCRB_Passport_Greek			P<GRCELLINAS<<GEORGIOS<<<<<<<<<<<<<<<<<<<<<<\r\nAE00000057GRC6504049M1208283<<<<<<<<<<<<<<00
    Read  Passport_OCR_NGUYENTHIHONGHANH			have no data
    Read  Passport_OCR_NGUYENGIANGSUONG			    have no data
    Read  Passport_OCR_KAMHEININ			        P<CHNKAM<<HEI<NIN<<<<<<<<<<<<<<<<<<<<<<<<<<<\r\nK000000000CHN6108045M1702057HK8888888<<<<<36
    Read  Passport_OCR_ZHENGJIANYANGBEN			    have no data
    Read  Passport_OCR_Singapore			        PASGPWONG<<KARA<YUN<EN<<<<<<<<<<<<<<<<<<<<<<\r\nK0000000E4SGP7705038F2210300S7788888H<<<<<98
    Read  Passport_OCR_Portuguesa			        have no data
    Read  Passport_OCR_Malaysia			            have no data
    Read  Passport_OCR_Canada			            P<CANSTEARNE<<JOHN<TIMOTHY<KELLY<<<<<<<<<<<<\r\nGA302922<0CAN5807020M2409043<<<<<<<<<<<<<<02
    Read  Passport_OCR_Thailan			            P<THAWANNATIM<<ASSANA<<<<<<<<<<<<<<<<<<<<<<<\r\nZ323416<<2THA1104123M17030101103704636662<14
    Read  Passport_OCR_HongKong			            have no data
    Read  Passport_OCR_ThailandTHATHONGPLEW			have no data
    Read  Passport_OCR_SERBIA			            P<SRBTEST<<MILICA<<<<<<<<<<<<<<<<<<<<<<<<<<<\r\n0000000000SRB6802295F22101042902968000000<40
    Read  Passport_OCR_CZECH			            have no data
    Read  Passport_OCR_USA			                P<USATRAVELER<<HAPPY<<<<<<<<<<<<<<<<<<<<<<<<\r\n3400072370USA6707046F1608078910000193<<<<<38
    Read  Passport_OCR_Bangladesh			        P<BGDISLAM<<MD<ARIFUL<<<<<<<<<<<<<<<<<<<<<<<\r\nAF41059314BGD8310257M18031161314723635949<98
    Read  Passport_OCR_Vietnam			            have no data
    Read  Passport_OCR_Indonesia			        have no data
    Read  Passport_OCR_Portuguesa_GARCAODEMAGA			P<PRTGARCAO<DE<MAGALHAES<<INES<<<<<<<<<<<<<<\r\nI700044<<9PRT7404076F220616199999999<<<<<<80
Verify can read OCRB_Postal
    [Documentation]  Check OCEN tag and combination of this tag. Also check label ID of each font.
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                       Expected result
    Send  $S,COCEN00000004,Ar			$>,>,>
    Read  OCRB_Postal_451_9_1			000011114477< 451>
    Read  OCRB_Postal_451_9_2			100880099001< 451>
    Read  OCRB_Postal_451_9_3			000000896357< 451>
    Read  OCRB_Postal_451_9_4			000005252449< 451>
    Read  OCRB_Postal_451_10_1			002525686933< 451>
    Read  OCRB_Postal_451_10_2			422772266994< 451>
    Read  OCRB_Postal_451_10_3			000000663895< 451>
    Read  OCRB_Postal_451_10_4			000639389051< 451>
    Read  OCRB_Postal_451_11_1			008800996600< 451>
    Read  OCRB_Postal_451_11_2			866006699338< 451>
    Read  OCRB_Postal_451_11_3			000000014273< 451>
    Read  OCRB_Postal_451_11_4			000896663308< 451>
    Read  OCRB_Postal_451_12_1			000147741224< 451>
    Read  OCRB_Postal_451_12_2			338900109833< 451>
    Read  OCRB_Postal_451_12_3			000005687214< 451>
    Read  OCRB_Postal_451_12_4			000241114963< 451>
    Read  OCRB_Postal_674_1.1.9.1_1			<000001111111111102> 000011114477< 674>
    Read  OCRB_Postal_674_1.1.9.2_2			<000001111111111102> 100880099001< 674>
    Read  OCRB_Postal_674_1.2.9.3_3			<502713341565779873> 000000896357< 674>
    Read  OCRB_Postal_674_1.2.9.4_4			<502713341565779873> 000005252449< 674>
    Read  OCRB_Postal_674_2.1.10.1_1			<015988338866144406> 002525686933< 674>
    Read  OCRB_Postal_674_2.1.10.2_2			<015988338866144406> 422772266994< 674>
    Read  OCRB_Postal_674_2.2.10.3_3			<123456789012345654> 000000663895< 674>
    Read  OCRB_Postal_674_2.2.10.4_4			<123456789012345654> 000639389051< 674>
    Read  OCRB_Postal_674_3.1.11.1_1			<000000127773663152> 008800996600< 674>
    Read  OCRB_Postal_674_3.1.11.2_2			<000000127773663152> 866006699338< 674>
    Read  OCRB_Postal_674_3.2.11.3_3			<555566668877441190> 000000014273< 674>
    Read  OCRB_Postal_674_4.1.12.1_1			<000100005149999944> 000147741224< 674>
    Read  OCRB_Postal_674_4.1.12.2_2			<000100005149999944> 538900109833< 674>
    Read  OCRB_Postal_674_4.2.12.3_3			<333888855522224400> 000005687214< 674>
    Read  OCRB_Postal_674_4.2.12.4_4			<333888855522224400> 000241114963< 674>
    Read  OCRB_Postal_896_1.1.5.1.9.1_1			<000001111111111102> 00000018+60> 000011114477< 896>
    Read  OCRB_Postal_896_1.1.5.1.9.2_2			<000001111111111102> 00000018+60> 100880099001< 896>
    Read  OCRB_Postal_896_1.2.5.2.9.3_3			<502713341565779873> 11144477+99> 000000896357< 896>
    Read  OCRB_Postal_896_1.2.5.2.9.4_4			<502713341565779873> 11144477+99> 000005252449< 896>
    Read  OCRB_Postal_896_2.1.6.1.10.1_1			<015988338866144406> 00000988+69> 002525686933< 896>
    Read  OCRB_Postal_896_2.1.6.1.10.2_2			<015988338866144406> 00000988+69> 422772266994< 896>
    Read  OCRB_Postal_896_2.2.6.2.10.3_3			<123456789012345654> 99226334+55> 000000663895< 896>
    Read  OCRB_Postal_896_2.2.6.2.10.4_4			<123456789012345654> 99226334+55> 000639389051< 896>
    Read  OCRB_Postal_896_3.1.7.1.11.1_1			<000000127773663152> 00009863+83> 008800996600< 896>
    Read  OCRB_Postal_896_3.1.7.1.11.2_2			<000000127773663152> 00009863+83> 866006699338< 896>
    Read  OCRB_Postal_896_3.2.7.2.11.3_3			<555566668877441190> 74400089+31> 000000014273< 896>
    Read  OCRB_Postal_896_3.2.7.2.11.4_4			<555566668877441190> 74400089+31> 000896663308< 896>
    Read  OCRB_Postal_896_4.1.8.1.12.1_1			<000100005149999944> 01472569+83> 000147741224< 896>
    Read  OCRB_Postal_896_4.1.8.1.12.2_2			<000100005149999944> 01472569+83> 338900109833< 896>
    Read  OCRB_Postal_896_4.2.8.2.12.3_3			<333888855522224400> 15555566+11> 000005687214< 896>
    Read  OCRB_Postal_896_4.2.8.2.12.4_4			<333888855522224400> 15555566+11> 000241114963< 896>
    Read  OCRB_Postal_247_1.1.5.1.9.1_1			<000001111111111102> 00000018+60> 000011114477< 247>
    Read  OCRB_Postal_247_1.1.5.1.9.2_2			<000001111111111102> 00000018+60> 100880099001< 247>
    Read  OCRB_Postal_247_1.2.5.2.9.3_3			<502713341565779873> 11144477+99> 000000896357< 247>
    Read  OCRB_Postal_247_1.2.5.2.9.4_4			<502713341565779873> 11144477+99> 000005252449< 247>
    Read  OCRB_Postal_247_2.1.6.1.10.1_1			<015988338866144406> 00000988+69> 002525686933< 247>
    Read  OCRB_Postal_247_2.1.6.1.10.2_2			<015988338866144406> 00000988+69> 422772266994< 247>
    Read  OCRB_Postal_247_2.2.6.2.10.3_3			<123456789012345654> 99226334+55> 000000663895< 247>
    Read  OCRB_Postal_247_3.1.7.1.11.1_1			<000000127773663152> 00009863+83> 008800996600< 247>
    Read  OCRB_Postal_247_3.1.7.1.11.2_2			<000000127773663152> 00009863+83> 866006699338< 247>
    Read  OCRB_Postal_247_3.2.7.2.11.3_3			<555566668877441190> 74400089+31> 000000014273< 247>
    Read  OCRB_Postal_247_3.2.7.2.11.4_4			<555566668877441190> 74400089+31> 000896663308< 247>
    Read  OCRB_Postal_247_4.1.8.1.12.1_1			<000100005149999944> 01472569+83> 000147741224< 247>
    Read  OCRB_Postal_247_4.1.8.1.12.2_2			<000100005149999944> 01472569+83> 338900109833< 247>
    Read  OCRB_Postal_247_4.2.8.2.12.3_3			<333888855522224400> 15555566+11> 000005687214< 247>
    Read  OCRB_Postal_247_4.2.8.2.12.4_4			<333888855522224400> 15555566+11> 000241114963< 247>
Verify can read Italian ITB Bank
    [Documentation]  Check OCEN tag and combination of this tag. Also check label ID of each font.
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                       Expected result
    Send  $S,COCEN00000008,Ar			$>,>,>
    Read  Italian ITB Bank OCR_1        ${EMPTY}
    Read  Italian ITB Bank OCR_2        ${EMPTY}
Verify can read SwissDriverLisence
    [Documentation]  Check OCEN tag and combination of this tag. Also check label ID of each font.
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                       Expected result
    Send  $S,COCEN00000010,Ar			$>,>,>
    Read  SwissDriverLisence			AKU735D<<\r\nFACHE000231268003<<530727<<<<<\r\nAELLEN<<ROLAND<<<<<<<<<<<<<<<<
Verify can read EU Identify card and OCRB_Passport
    [Documentation]  Check OCEN tag and combination of this tag. Also check label ID of each font.
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                       Expected result
    Send  $S,COCEN00000007,Ar			$>,>,>
    Read  EUIdentifyCard_MADRID			have no data
    Read  EU Identify card_TESTV			IDCHE1234567897<<<<<<<<<<<<<<<\r\n6605083F2404200ITA<<<<<<<<<<<8\r\nABCDEFGHIJK<<LMNOPQRST<UVWXYZ<
    Read  EU Identify card_LiestalBL			IDCHEE1491644<7<<<<<<<<<<<<<<<\r\n6911133M2305020CHE<<<<<<<<<<<8\r\nSALATHE<<MARC<<<<<<<<<<<<<<<<<
    Read  EU Identify card_BaselStadtBS			IDCHEC8391896<6<<<<<<<<<<<<<<<\r\n5406087M2603173CHE<<<<<<<<<<<0\r\nVORDERMANN<<GILBERT<LUCIEN<<<<
    Read  EU Identify card_LiestalBL_2			IDCHEE3351460<4<<<<<<<<<<<<<<<\r\n6006303M2711014CHE<<<<<<<<<<<2\r\nBAUMGARTNER<<CHRISTOPH<DANIEL<
    Read  EU Identify card_Organce			have no data
    Read  OCRB_Passport_Label1			PPATAIJLHFHTNMW<<ODQCPGRSBU<<<<<<<<<<<<<<<<<\r\nBPBPRBDRD5ATA8811259M2008309UQDKHLFIWVLLIZ68
    Read  OCRB_Passport_Original Label			P<GRCELLINAS<<GEORGIOS<<<<<<<<<<<<<<<<<<<<<<\r\nAE00000057GRC6504049M1208283<<<<<<<<<<<<<<00
    Read  OCRB_Passport_Label2			PQCCKYVYVXZXZIK<<LTLTIILLLL<<<<<<<<<<<<<<<<<\r\nOPUDBIJIL3CCK4408305F2206208LLIIFHINNYZXNM70
    Read  OCRB_Passport_Label3			P<HARG896GDO0CPR<<KFKFLVXVXV<66P9KK442K<<<<<\r\n089DB1J2L8ARG4408305F2206208LLI1F8IN36ZX7M18
    Read  OCRB_Passport_Label4			PRBOLSBSBRRSSPP<<KXKXKX77XK<<UOUONM11NM<<<<<\r\nUA633KLIG3BOL8904159M25102841OFCCSSF58Z17M30
    Read  OCRB_Passport_Label5			PGBWA1717447744<<8899666969<<<<<<<<<<<<<<<<<\r\n3336565997BWA8905178M25122991759562144383886
    Read  OCRB_Passport_Label6			PKCOD5565653382<<1412561441<<<<<<<<<<<<<<<<<\r\n3996637113COD9203181F24102031442256358741288
    Read  OCRB_Passport_VN			P<VNMNGUYEN<<PHUONG<THAO<<<<<<<<<<<<<<<<<<<<\r\nB3080919<5VNM8408233M1905065311746931<<<<<56
    Read  OCRB_Passport_Italian			have no data
    Read  OCRB_Passport_Greek			P<GRCELLINAS<<GEORGIOS<<<<<<<<<<<<<<<<<<<<<<\r\nAE00000057GRC6504049M1208283<<<<<<<<<<<<<<00
    Read  Passport_OCR_NGUYENTHIHONGHANH			have no data
    Read  Passport_OCR_NGUYENGIANGSUONG			have no data
    Read  Passport_OCR_KAMHEININ			P<CHNKAM<<HEI<NIN<<<<<<<<<<<<<<<<<<<<<<<<<<<\r\nK000000000CHN6108045M1702057HK8888888<<<<<36
    Read  Passport_OCR_ZHENGJIANYANGBEN			have no data
    Read  Passport_OCR_Singapore			PASGPWONG<<KARA<YUN<EN<<<<<<<<<<<<<<<<<<<<<<\r\nK0000000E4SGP7705038F2210300S7788888H<<<<<98
    Read  Passport_OCR_Portuguesa			have no data
    Read  Passport_OCR_Malaysia			have no data
    Read  Passport_OCR_Canada			P<CANSTEARNE<<JOHN<TIMOTHY<KELLY<<<<<<<<<<<<\r\nGA302922<0CAN5807020M2409043<<<<<<<<<<<<<<02
    Read  Passport_OCR_Thailan			P<THAWANNATIM<<ASSANA<<<<<<<<<<<<<<<<<<<<<<<\r\nZ323416<<2THA1104123M17030101103704636662<14
    Read  Passport_OCR_HongKong			have no data
    Read  Passport_OCR_ThailandTHATHONGPLEW			have no data
    Read  Passport_OCR_SERBIA			P<SRBTEST<<MILICA<<<<<<<<<<<<<<<<<<<<<<<<<<<\r\n0000000000SRB6802295F22101042902968000000<40
    Read  Passport_OCR_CZECH			have no data
    Read  Passport_OCR_USA			P<USATRAVELER<<HAPPY<<<<<<<<<<<<<<<<<<<<<<<<\r\n3400072370USA6707046F1608078910000193<<<<<38
    Read  Passport_OCR_Bangladesh			P<BGDISLAM<<MD<ARIFUL<<<<<<<<<<<<<<<<<<<<<<<\r\nAF41059314BGD8310257M18031161314723635949<98
    Read  Passport_OCR_Vietnam			have no data
    Read  Passport_OCR_Indonesia			have no data
    Read  Passport_OCR_Portuguesa_GARCAODEMAGA			P<PRTGARCAO<DE<MAGALHAES<<INES<<<<<<<<<<<<<<\r\nI700044<<9PRT7404076F220616199999999<<<<<<80
    Read  Italian ITB Bank OCR_1
    Read  Italian ITB Bank OCR_2
Verify can read OCRB_Passport and Postal
    [Documentation]  Check OCEN tag and combination of this tag. Also check label ID of each font.
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                       Expected result
    Send  $S,COCEN0000000E,Ar			$>,>,>
    Read  OCRB_Passport_Label1			PPATAIJLHFHTNMW<<ODQCPGRSBU<<<<<<<<<<<<<<<<<\r\nBPBPRBDRD5ATA8811259M2008309UQDKHLFIWVLLIZ68
    Read  OCRB_Passport_Original Label			P<GRCELLINAS<<GEORGIOS<<<<<<<<<<<<<<<<<<<<<<\r\nAE00000057GRC6504049M1208283<<<<<<<<<<<<<<00
    Read  OCRB_Passport_Label2			PQCCKYVYVXZXZIK<<LTLTIILLLL<<<<<<<<<<<<<<<<<\r\nOPUDBIJIL3CCK4408305F2206208LLIIFHINNYZXNM70
    Read  OCRB_Passport_Label3			P<HARG896GDOQCPR<<KFKFLVXVXV<66P9KK442K<<<<<\r\n089DB1J2L8ARG4408305F2206208LLI1F8IN36ZX7M18
    Read  OCRB_Passport_Label4			PRBOLSBSBRRSSPP<<KXKXKX77XK<<UOUONM11NM<<<<<\r\nUA633KLIG3BOL8904159M25102841OFCCSSF58Z17M30
    Read  OCRB_Passport_Label5			PGBWA1717447744<<8899666969<<<<<<<<<<<<<<<<<\r\n3336565997BWA8905178M25122991759562144383886
    Read  OCRB_Passport_Label6			PKCOD5565653382<<1412561441<<<<<<<<<<<<<<<<<\r\n3996637113COD9203181F24102031442256358741288
    Read  OCRB_Passport_VN			P<VNMNGUYEN<<PHUONG<THAO<<<<<<<<<<<<<<<<<<<<\r\nB3080919<5VNM8408233M1905065311746931<<<<<56
    Read  OCRB_Passport_Italian
    Read  OCRB_Passport_Greek			P<GRCELLINAS<<GEORGIOS<<<<<<<<<<<<<<<<<<<<<<\r\nAE00000057GRC6504049M1208283<<<<<<<<<<<<<<00
    Read  Passport_OCR_NGUYENTHIHONGHANH			have no data
    Read  Passport_OCR_NGUYENGIANGSUONG			have no data
    Read  Passport_OCR_KAMHEININ			P<CHNKAM<<HEI<NIN<<<<<<<<<<<<<<<<<<<<<<<<<<<\r\nK000000000CHN6108045M1702057HK8888888<<<<<36
    Read  Passport_OCR_ZHENGJIANYANGBEN			have no data
    Read  Passport_OCR_Singapore			PASGPWONG<<KARA<YUN<EN<<<<<<<<<<<<<<<<<<<<<<\r\nK0000000E4SGP7705038F2210300S7788888H<<<<<98
    Read  Passport_OCR_Portuguesa			have no data
    Read  Passport_OCR_Malaysia			have no data
    Read  Passport_OCR_Canada			P<CANSTEARNE<<JOHN<TIMOTHY<KELLY<<<<<<<<<<<<\r\nGA302922<0CAN5807020M2409043<<<<<<<<<<<<<<02
    Read  Passport_OCR_Thailan			P<THAWANNATIM<<ASSANA<<<<<<<<<<<<<<<<<<<<<<<\r\nZ323416<<2THA1104123M17030101103704636662<14
    Read  Passport_OCR_HongKong			have no data
    Read  Passport_OCR_ThailandTHATHONGPLEW			have no data
    Read  Passport_OCR_SERBIA			P<SRBTEST<<MILICA<<<<<<<<<<<<<<<<<<<<<<<<<<<\r\n0000000000SRB6802295F22101042902968000000<40
    Read  Passport_OCR_CZECH			have no data
    Read  Passport_OCR_USA			P<USATRAVELER<<HAPPY<<<<<<<<<<<<<<<<<<<<<<<<\r\n3400072370USA6707046F1608078910000193<<<<<38
    Read  Passport_OCR_Bangladesh			P<BGDISLAM<<MD<ARIFUL<<<<<<<<<<<<<<<<<<<<<<<\r\nAF41059314BGD8310257M18031161314723635949<98
    Read  Passport_OCR_Vietnam			have no data
    Read  Passport_OCR_Indonesia			have no data
    Read  Passport_OCR_Portuguesa_GARCAODEMAGA			P<PRTGARCAO<DE<MAGALHAES<<INES<<<<<<<<<<<<<<\r\nI700044<<9PRT7404076F220616199999999<<<<<<80
    Read  OCRB_Postal_451_9_1			000011114477< 451>
    Read  OCRB_Postal_451_9_2			100880099001< 451>
    Read  OCRB_Postal_451_9_3			000000896357< 451>
    Read  OCRB_Postal_451_9_4			000005252449< 451>
    Read  OCRB_Postal_451_10_1			002525686933< 451>
    Read  OCRB_Postal_451_10_2			422772266994< 451>
    Read  OCRB_Postal_451_10_3			000000663895< 451>
    Read  OCRB_Postal_451_10_4			000639389051< 451>
    Read  OCRB_Postal_451_11_1			008800996600< 451>
    Read  OCRB_Postal_451_11_2			866006699338< 451>
    Read  OCRB_Postal_451_11_3			000000014273< 451>
    Read  OCRB_Postal_451_11_4			000896663308< 451>
    Read  OCRB_Postal_451_12_1			000147741224< 451>
    Read  OCRB_Postal_451_12_2			338900109833< 451>
    Read  OCRB_Postal_451_12_3			000005687214< 451>
    Read  OCRB_Postal_451_12_4			000241114963< 451>
    Read  OCRB_Postal_674_1.1.9.1_1			<000001111111111102> 000011114477< 674>
    Read  OCRB_Postal_674_1.1.9.2_2			<000001111111111102> 100880099001< 674>
    Read  OCRB_Postal_674_1.2.9.3_3			<502713341565779873> 000000896357< 674>
    Read  OCRB_Postal_674_1.2.9.4_4			<502713341565779873> 000005252449< 674>
    Read  OCRB_Postal_674_2.1.10.1_1			<015988338866144406> 002525686933< 674>
    Read  OCRB_Postal_674_2.1.10.2_2			<015988338866144406> 422772266994< 674>
    Read  OCRB_Postal_674_2.2.10.3_3			<123456789012345654> 000000663895< 674>
    Read  OCRB_Postal_674_2.2.10.4_4			<123456789012345654> 000639389051< 674>
    Read  OCRB_Postal_674_3.1.11.1_1			<000000127773663152> 008800996600< 674>
    Read  OCRB_Postal_674_3.1.11.2_2			<000000127773663152> 866006699538< 674>
    Read  OCRB_Postal_674_3.2.11.3_3			<555566668877441190> 000000014273< 674>
    Read  OCRB_Postal_674_4.1.12.1_1			<000100005149999944> 000147741224< 674>
    Read  OCRB_Postal_674_4.1.12.2_2			<000100005149999944> 538900109833< 674>
    Read  OCRB_Postal_674_4.2.12.3_3			<333888855522224400> 000005687214< 674>
    Read  OCRB_Postal_674_4.2.12.4_4			<333888855522224400> 000241114963< 674>
    Read  OCRB_Postal_896_1.1.5.1.9.1_1			<000001111111111102> 00000018+60> 000011114477< 896>
    Read  OCRB_Postal_896_1.1.5.1.9.2_2			<000001111111111102> 00000018+60> 100880099001< 896>
    Read  OCRB_Postal_896_1.2.5.2.9.3_3			<502713341565779873> 11144477+99> 000000896357< 896>
    Read  OCRB_Postal_896_1.2.5.2.9.4_4			<502713341565779873> 11144477+99> 000005252449< 896>
    Read  OCRB_Postal_896_2.1.6.1.10.1_1			<015988338866144406> 00000988+69> 002525686933< 896>
    Read  OCRB_Postal_896_2.1.6.1.10.2_2			<015988338866144406> 00000988+69> 422772266994< 896>
    Read  OCRB_Postal_896_2.2.6.2.10.3_3			<123456789012345654> 99226334+55> 000000663895< 896>
    Read  OCRB_Postal_896_2.2.6.2.10.4_4			<123456789012345654> 99226334+55> 000639389051< 896>
    Read  OCRB_Postal_896_3.1.7.1.11.1_1			<000000127773663152> 00009863+83> 008800996600< 896>
    Read  OCRB_Postal_896_3.1.7.1.11.2_2			<000000127773663152> 00009863+83> 866006699338< 896>
    Read  OCRB_Postal_896_3.2.7.2.11.3_3			<555566668877441190> 74400089+31> 000000014273< 896>
    Read  OCRB_Postal_896_3.2.7.2.11.4_4			<555566668877441190> 74400089+31> 000896663308< 896>
    Read  OCRB_Postal_896_4.1.8.1.12.1_1			<000100005149999944> 01472569+83> 000147741224< 896>
    Read  OCRB_Postal_896_4.1.8.1.12.2_2			<000100005149999944> 01472569+83> 338900109833< 896>
    Read  OCRB_Postal_896_4.2.8.2.12.3_3			<333888855522224400> 15555566+11> 000005687214< 896>
    Read  OCRB_Postal_896_4.2.8.2.12.4_4			<333888855522224400> 15555566+11> 000241114963< 896>
    Read  OCRB_Postal_247_1.1.5.1.9.1_1			<000001111111111102> 00000018+60> 000011114477< 247>
    Read  OCRB_Postal_247_1.1.5.1.9.2_2			<000001111111111102> 00000018+60> 100880099001< 247>
    Read  OCRB_Postal_247_1.2.5.2.9.3_3			<502713341565779873> 11144477+99> 000000896357< 247>
    Read  OCRB_Postal_247_1.2.5.2.9.4_4			<502713341565779873> 11144477+99> 000005252449< 247>
    Read  OCRB_Postal_247_2.1.6.1.10.1_1			<015988338866144406> 00000988+69> 002525686933< 247>
    Read  OCRB_Postal_247_2.1.6.1.10.2_2			<015988338866144406> 00000988+69> 422772266994< 247>
    Read  OCRB_Postal_247_2.2.6.2.10.3_3			<123456789012345654> 99226334+55> 000000663895< 247>
    Read  OCRB_Postal_247_3.1.7.1.11.1_1			<000000127773663152> 00009863+83> 008800996600< 247>
    Read  OCRB_Postal_247_3.1.7.1.11.2_2			<000000127773663152> 00009863+83> 866006699338< 247>
    Read  OCRB_Postal_247_3.2.7.2.11.3_3			<555566668877441190> 74400089+31> 000000014273< 247>
    Read  OCRB_Postal_247_3.2.7.2.11.4_4			<555566668877441190> 74400089+31> 000896663308< 247>
    Read  OCRB_Postal_247_4.1.8.1.12.1_1			<000100005149999944> 01472569+83> 000147741224< 247>
    Read  OCRB_Postal_247_4.1.8.1.12.2_2			<000100005149999944> 01472569+83> 338900109833< 247>
    Read  OCRB_Postal_247_4.2.8.2.12.3_3			<333888855522224400> 15555566+11> 000005687214< 247>
    Read  OCRB_Postal_247_4.2.8.2.12.4_4			<333888855522224400> 15555566+11> 000241114963< 247>
    Read  Italian ITB Bank OCR_1			have no data
    Read  Italian ITB Bank OCR_2			have no data
Verify can read OCRB Postal and Italian ITB Bank
    [Documentation]  Check OCEN tag and combination of this tag. Also check label ID of each font.
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                       Expected result
    Send  $S,COCEN0000001C,Ar			$>,>,>
    Read  SwissDriverLisence			AKU735D<<\r\nFACHE000231268003<<530727<<<<<\r\nAELLEN<<ROLAND<<<<<<<<<<<<<<<<
    Read  Italian ITB Bank OCR_1			have no data
    Read  Italian ITB Bank OCR_2			have no data
    Read  OCRB_Postal_451_9_1			000011114477< 451>
    Read  OCRB_Postal_451_9_2			100880099001< 451>
    Read  OCRB_Postal_451_9_3			000000896357< 451>
    Read  OCRB_Postal_451_9_4			000005252449< 451>
    Read  OCRB_Postal_451_10_1			002525686933< 451>
    Read  OCRB_Postal_451_10_2			422772266994< 451>
    Read  OCRB_Postal_451_10_3			000000663895< 451>
    Read  OCRB_Postal_451_10_4			000639389051< 451>
    Read  OCRB_Postal_451_11_1			008800996600< 451>
    Read  OCRB_Postal_451_11_2			866006699338< 451>
    Read  OCRB_Postal_451_11_3			000000014273< 451>
    Read  OCRB_Postal_451_11_4			000896663308< 451>
    Read  OCRB_Postal_451_12_1			000147741224< 451>
    Read  OCRB_Postal_451_12_2			338900109833< 451>
    Read  OCRB_Postal_451_12_3			000005687214< 451>
    Read  OCRB_Postal_451_12_4			000241114963< 451>
    Read  OCRB_Postal_674_1.1.9.1_1			<000001111111111102> 000011114477< 674>
    Read  OCRB_Postal_674_1.1.9.2_2			<000001111111111102> 100880099001< 674>
    Read  OCRB_Postal_674_1.2.9.3_3			<502713341565779873> 000000896357< 674>
    Read  OCRB_Postal_674_1.2.9.4_4			<502713341565779873> 000005252449< 674>
    Read  OCRB_Postal_674_2.1.10.1_1			<015988338866144406> 002525686933< 674>
    Read  OCRB_Postal_674_2.1.10.2_2			<015988338866144406> 422772266994< 674>
    Read  OCRB_Postal_674_2.2.10.3_3			<123456789012345654> 000000663895< 674>
    Read  OCRB_Postal_674_2.2.10.4_4			<123456789012345654> 000639389051< 674>
    Read  OCRB_Postal_674_3.1.11.1_1			<000000127773663152> 008800996600< 674>
    Read  OCRB_Postal_674_3.1.11.2_2			<000000127773663152> 866006699538< 674>
    Read  OCRB_Postal_674_3.2.11.3_3			<555566668877441190> 000000014273< 674>
    Read  OCRB_Postal_674_4.1.12.1_1			<000100005149999944> 000147741224< 674>
    Read  OCRB_Postal_674_4.1.12.2_2			<000100005149999944> 538900109833< 674>
    Read  OCRB_Postal_674_4.2.12.3_3			<333888855522224400> 000005687214< 674>
    Read  OCRB_Postal_674_4.2.12.4_4			<333888855522224400> 000241114963< 674>
    Read  OCRB_Postal_896_1.1.5.1.9.1_1			<000001111111111102> 00000018+60> 000011114477< 896>
    Read  OCRB_Postal_896_1.1.5.1.9.2_2			<000001111111111102> 00000018+60> 100880099001< 896>
    Read  OCRB_Postal_896_1.2.5.2.9.3_3			<502713341565779873> 11144477+99> 000000896357< 896>
    Read  OCRB_Postal_896_1.2.5.2.9.4_4			<502713341565779873> 11144477+99> 000005252449< 896>
    Read  OCRB_Postal_896_2.1.6.1.10.1_1			<015988338866144406> 00000988+69> 002525686933< 896>
    Read  OCRB_Postal_896_2.1.6.1.10.2_2			<015988338866144406> 00000988+69> 422772266994< 896>
    Read  OCRB_Postal_896_2.2.6.2.10.3_3			<123456789012345654> 99226334+55> 000000663895< 896>
    Read  OCRB_Postal_896_2.2.6.2.10.4_4			<123456789012345654> 99226334+55> 000639389051< 896>
    Read  OCRB_Postal_896_3.1.7.1.11.1_1			<000000127773663152> 00009863+83> 008800996600< 896>
    Read  OCRB_Postal_896_3.1.7.1.11.2_2			<000000127773663152> 00009863+83> 866006699338< 896>
    Read  OCRB_Postal_896_3.2.7.2.11.3_3			<555566668877441190> 74400089+31> 000000014273< 896>
    Read  OCRB_Postal_896_3.2.7.2.11.4_4			<555566668877441190> 74400089+31> 000896663308< 896>
    Read  OCRB_Postal_896_4.1.8.1.12.1_1			<000100005149999944> 01472569+83> 000147741224< 896>
    Read  OCRB_Postal_896_4.1.8.1.12.2_2			<000100005149999944> 01472569+83> 338900109833< 896>
    Read  OCRB_Postal_896_4.2.8.2.12.3_3			<333888855522224400> 15555566+11> 000005687214< 896>
    Read  OCRB_Postal_896_4.2.8.2.12.4_4			<333888855522224400> 15555566+11> 000241114963< 896>
    Read  OCRB_Postal_247_1.1.5.1.9.1_1			<000001111111111102> 00000018+60> 000011114477< 247>
    Read  OCRB_Postal_247_1.1.5.1.9.2_2			<000001111111111102> 00000018+60> 100880099001< 247>
    Read  OCRB_Postal_247_1.2.5.2.9.3_3			<502713341565779873> 11144477+99> 000000896357< 247>
    Read  OCRB_Postal_247_1.2.5.2.9.4_4			<502713341565779873> 11144477+99> 000005252449< 247>
    Read  OCRB_Postal_247_2.1.6.1.10.1_1			<015988338866144406> 00000988+69> 002525686933< 247>
    Read  OCRB_Postal_247_2.1.6.1.10.2_2			<015988338866144406> 00000988+69> 422772266994< 247>
    Read  OCRB_Postal_247_2.2.6.2.10.3_3			<123456789012345654> 99226334+55> 000000663895< 247>
    Read  OCRB_Postal_247_3.1.7.1.11.1_1			<000000127773663152> 00009863+83> 008800996600< 247>
    Read  OCRB_Postal_247_3.1.7.1.11.2_2			<000000127773663152> 00009863+83> 866006699338< 247>
    Read  OCRB_Postal_247_3.2.7.2.11.3_3			<555566668877441190> 74400089+31> 000000014273< 247>
    Read  OCRB_Postal_247_3.2.7.2.11.4_4			<555566668877441190> 74400089+31> 000896663308< 247>
    Read  OCRB_Postal_247_4.1.8.1.12.1_1			<000100005149999944> 01472569+83> 000147741224< 247>
    Read  OCRB_Postal_247_4.1.8.1.12.2_2			<000100005149999944> 01472569+83> 338900109833< 247>
    Read  OCRB_Postal_247_4.2.8.2.12.3_3			<333888855522224400> 15555566+11> 000005687214< 247>
    Read  OCRB_Postal_247_4.2.8.2.12.4_4			<333888855522224400> 15555566+11> 000241114963< 247>
Verify can read SwissDriverLisence and Italian ITB Bank
    [Documentation]  Check OCEN tag and combination of this tag. Also check label ID of each font.
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                       Expected result
    Send  $S,COCEN00000015,Ar			$>,>,>
    Read  SwissDriverLisence			AKU735D<<\r\nFACHE000231268003<<530727<<<<<\r\nAELLEN<<ROLAND<<<<<<<<<<<<<<<<
    Read  Italian ITB Bank OCR_1			have no data
    Read  Italian ITB Bank OCR_2			have no data
    Read  EUIdentifyCard_MADRID			have no data
Verify can read SwissDriverLisence and Italian ITB Bank
    [Documentation]  Check OCEN tag and combination of this tag. Also check label ID of each font.
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                       Expected result
    Send  $S,COCEN0000001A,Ar			$>,>,>
    Read  SwissDriverLisence			AKU735D<<\r\nFACHE000231268003<<530727<<<<<\r\nAELLEN<<ROLAND<<<<<<<<<<<<<<<<
    Read  Italian ITB Bank OCR_1			have no data
    Read  Italian ITB Bank OCR_2			have no data
    Read  OCRB_Passport_Label1			PPATAIJLHFHTNMW<<ODQCPGRSBU<<<<<<<<<<<<<<<<<\r\nBPBPRBDRD5ATA8811259M2008309UQDKHLFIWVLLIZ68
    Read  OCRB_Passport_Original Label			P<GRCELLINAS<<GEORGIOS<<<<<<<<<<<<<<<<<<<<<<\r\nAE00000057GRC6504049M1208283<<<<<<<<<<<<<<00
    Read  OCRB_Passport_Label2			PQCCKYVYVXZXZIK<<LTLTIILLLL<<<<<<<<<<<<<<<<<\r\nOPUDBIJIL3CCK4408305F2206208LLIIFHINNYZXNM70
    Read  OCRB_Passport_Label3			P<HARG896GDOQCPR<<KFKFLVXVXV<66P9KK442K<<<<<\r\n089DB1J2L8ARG4408305F2206208LLI1F8IN36ZX7M18
    Read  OCRB_Passport_Label4			PRBOLSBSBRRSSPP<<KXKXKX77XK<<UOUONM11NM<<<<<\r\nUA633KLIG3BOL8904159M25102841OFCCSSF58Z17M30
    Read  OCRB_Passport_Label5			PGBWA1717447744<<8899666969<<<<<<<<<<<<<<<<<\r\n3336565997BWA8905178M25122991759562144383886
    Read  OCRB_Passport_Label6			PKCOD5565653382<<1412561441<<<<<<<<<<<<<<<<<\r\n3996637113COD9203181F24102031442256358741288
    Read  OCRB_Passport_VN			P<VNMNGUYEN<<PHUONG<THAO<<<<<<<<<<<<<<<<<<<<\r\nB3080919<5VNM8408233M1905065311746931<<<<<56
    Read  OCRB_Passport_Italian			have no data
    Read  OCRB_Passport_Greek			P<GRCELLINAS<<GEORGIOS<<<<<<<<<<<<<<<<<<<<<<\r\nAE00000057GRC6504049M1208283<<<<<<<<<<<<<<00
    Read  Passport_OCR_NGUYENTHIHONGHANH			have no data
    Read  Passport_OCR_NGUYENGIANGSUONG			have no data
    Read  Passport_OCR_KAMHEININ			P<CHNKAM<<HEI<NIN<<<<<<<<<<<<<<<<<<<<<<<<<<<\r\nK000000000CHN6108045M1702057HK8888888<<<<<36
    Read  Passport_OCR_ZHENGJIANYANGBEN			have no data
    Read  Passport_OCR_Singapore			PASGPWONG<<KARA<YUN<EN<<<<<<<<<<<<<<<<<<<<<<\r\nK0000000E4SGP7705038F2210300S7788888H<<<<<98
    Read  Passport_OCR_Portuguesa			have no data
    Read  Passport_OCR_Malaysia			have no data
    Read  Passport_OCR_Canada			P<CANSTEARNE<<JOHN<TIMOTHY<KELLY<<<<<<<<<<<<\r\nGA302922<0CAN5807020M2409043<<<<<<<<<<<<<<02
    Read  Passport_OCR_Thailan			P<THAWANNATIM<<ASSANA<<<<<<<<<<<<<<<<<<<<<<<\r\nZ323416<<2THA1104123M17030101103704636662<14
    Read  Passport_OCR_HongKong			have no data
    Read  Passport_OCR_ThailandTHATHONGPLEW			have no data
    Read  Passport_OCR_SERBIA			P<SRBTEST<<MILICA<<<<<<<<<<<<<<<<<<<<<<<<<<<\r\n0000000000SRB6802295F22101042902968000000<40
    Read  Passport_OCR_CZECH			have no data
    Read  Passport_OCR_USA			P<USATRAVELER<<HAPPY<<<<<<<<<<<<<<<<<<<<<<<<\r\n3400072370USA6707046F1608078910000193<<<<<38
    Read  Passport_OCR_Bangladesh			P<BGDISLAM<<MD<ARIFUL<<<<<<<<<<<<<<<<<<<<<<<\r\nAF41059314BGD8310257M18031161314723635949<98
    Read  Passport_OCR_Vietnam			have no data
    Read  Passport_OCR_Indonesia			have no data
    Read  Passport_OCR_Portuguesa_GARCAODEMAGA			P<PRTGARCAO<DE<MAGALHAES<<INES<<<<<<<<<<<<<<\r\nI700044<<9PRT7404076F220616199999999<<<<<<80
Verify can read EU Identify card
    [Documentation]  Check OCEN tag and combination of this tag. Also check label ID of each font.
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                       Expected result
    Send  $S,COCEN0000001B,Ar			$>,>,>
    Read  EUIdentifyCard_MADRID			have no data
    Read  EU Identify card_TESTV			IDCHE1234567897<<<<<<<<<<<<<<<\r\n6605083F2404200ITA<<<<<<<<<<<8\r\nABCDEFGHIJK<<LMNOPQRST<UVWXYZ<
    Read  EU Identify card_LiestalBL			IDCHEE1491644<7<<<<<<<<<<<<<<<\r\n6911133M2305020CHE<<<<<<<<<<<8\r\nSALATHE<<MARC<<<<<<<<<<<<<<<<<
    Read  EU Identify card_BaselStadtBS			IDCHEC8391896<6<<<<<<<<<<<<<<<\r\n5406087M2603173CHE<<<<<<<<<<<0\r\nVORDERMANN<<GILBERT<LUCIEN<<<<
    Read  EU Identify card_LiestalBL_2			IDCHEE3351460<4<<<<<<<<<<<<<<<\r\n6006303M2711014CHE<<<<<<<<<<<2\r\nBAUMGARTNER<<CHRISTOPH<DANIEL<
    Read  EU Identify card_Organce			have no data
    Read  Italian ITB Bank OCR_1			have no data
    Read  Italian ITB Bank OCR_2			have no data
    Read  OCRB_Passport_Label1			PPATAIJLHFHTNMW<<ODQCPGRSBU<<<<<<<<<<<<<<<<<\r\nBPBPRBDRD5ATA8811259M2008309UQDKHLFIWVLLIZ68
    Read  OCRB_Passport_Original Label			P<GRCELLINAS<<GEORGIOS<<<<<<<<<<<<<<<<<<<<<<\r\nAE00000057GRC6504049M1208283<<<<<<<<<<<<<<00
    Read  OCRB_Passport_Label2			PQCCKYVYVXZXZIK<<LTLTIILLLL<<<<<<<<<<<<<<<<<\r\nOPUDBIJIL3CCK4408305F2206208LLIIFHINNYZXNM70
    Read  OCRB_Passport_Label3			P<HARG896GDOQCPR<<KFKFLVXVXV<66P9KK442K<<<<<\r\n089DB1J2L8ARG4408305F2206208LLI1F8IN36ZX7M18
    Read  OCRB_Passport_Label4			PRBOLSBSBRRSSPP<<KXKXKX77XK<<UOUONM11NM<<<<<\r\nUA633KLIG3BOL8904159M25102841OFCCSSF58Z17M30
    Read  OCRB_Passport_Label5			PGBWA1717447744<<8899666969<<<<<<<<<<<<<<<<<\r\n3336565997BWA8905178M25122991759562144383886
    Read  OCRB_Passport_Label6			PKCOD5565653382<<1412561441<<<<<<<<<<<<<<<<<\r\n3996637113COD9203181F24102031442256358741288
    Read  OCRB_Passport_VN			P<VNMNGUYEN<<PHUONG<THAO<<<<<<<<<<<<<<<<<<<<\r\nB3080919<5VNM8408233M1905065311746931<<<<<56
    Read  OCRB_Passport_Italian			have no data
    Read  OCRB_Passport_Greek			P<GRCELLINAS<<GEORGIOS<<<<<<<<<<<<<<<<<<<<<<\r\nAE00000057GRC6504049M1208283<<<<<<<<<<<<<<00
    Read  Passport_OCR_NGUYENTHIHONGHANH			have no data
    Read  Passport_OCR_NGUYENGIANGSUONG			have no data
    Read  Passport_OCR_KAMHEININ			P<CHNKAM<<HEI<NIN<<<<<<<<<<<<<<<<<<<<<<<<<<<\r\nK000000000CHN6108045M1702057HK8888888<<<<<36
    Read  Passport_OCR_ZHENGJIANYANGBEN			have no data
    Read  Passport_OCR_Singapore			PASGPWONG<<KARA<YUN<EN<<<<<<<<<<<<<<<<<<<<<<\r\nK0000000E4SGP7705038F2210300S7788888H<<<<<98
    Read  Passport_OCR_Portuguesa			have no data
    Read  Passport_OCR_Malaysia			have no data
    Read  Passport_OCR_Canada			P<CANSTEARNE<<JOHN<TIMOTHY<KELLY<<<<<<<<<<<<\r\nGA302922<0CAN5807020M2409043<<<<<<<<<<<<<<02
    Read  Passport_OCR_Thailan			P<THAWANNATIM<<ASSANA<<<<<<<<<<<<<<<<<<<<<<<\r\nZ323416<<2THA1104123M17030101103704636662<14
    Read  Passport_OCR_HongKong			have no data
    Read  Passport_OCR_ThailandTHATHONGPLEW			have no data
    Read  Passport_OCR_SERBIA			P<SRBTEST<<MILICA<<<<<<<<<<<<<<<<<<<<<<<<<<<\r\n0000000000SRB6802295F22101042902968000000<40
    Read  Passport_OCR_CZECH			have no data
    Read  Passport_OCR_USA			P<USATRAVELER<<HAPPY<<<<<<<<<<<<<<<<<<<<<<<<\r\n3400072370USA6707046F1608078910000193<<<<<38
    Read  Passport_OCR_Bangladesh			P<BGDISLAM<<MD<ARIFUL<<<<<<<<<<<<<<<<<<<<<<<\r\nAF41059314BGD8310257M18031161314723635949<98
    Read  Passport_OCR_Vietnam			have no data
    Read  Passport_OCR_Indonesia			have no data
    Read  Passport_OCR_Portuguesa_GARCAODEMAGA			P<PRTGARCAO<DE<MAGALHAES<<INES<<<<<<<<<<<<<<\r\nI700044<<9PRT7404076F220616199999999<<<<<<80
