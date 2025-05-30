*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}


*** Variables ***
${current_directory}         ${data_source}\\Quick_Test
*** test cases ***
Verify that default OCR_B is disable
    [Documentation]  Test case checks that OCR_B can be decoded succesfully. The OCR_B including OCR_B Passport & OCR_B Postal
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                       Expected result
    Send  $S,cOCEN,s	                    $>,>00000000,>
    Read  OCRB_Passport_Label1              ${EMPTY}
    Read  OCRB_Passport_Original Label      ${EMPTY}
    Read  OCRB_Postal_451_9_1               ${EMPTY}
    Read  OCRB_Postal_451_9_2               ${EMPTY}
Verify that Enable Passport OCR_B the HH can read Passport OCR_B but can't read Postal OCR_B
    [Documentation]  Test case checks that OCR_B can be decoded succesfully. The OCR_B including OCR_B Passport & OCR_B Postal
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                       Expected result
    Send  $S,COCEN00000002,Ar	            $>,>,>
    Read  OCRB_Passport_Label1	            PPATAIJLHFHTNMW<<ODQCPGRSBU<<<<<<<<<<<<<<<<<\r\nBPBPRBDRD5ATA8811259M2008309UQDKHLFIWVLLIZ68
    Read  OCRB_Passport_Original Label	    P<GRCELLINAS<<GEORGIOS<<<<<<<<<<<<<<<<<<<<<<\r\nAE00000057GRC6504049M1208283<<<<<<<<<<<<<<00
    Read  OCRB_Passport_Label2	            PQCCKYVYVXZXZIK<<LTLTIILLLL<<<<<<<<<<<<<<<<<\r\nOPUDBIJIL3CCK4408305F2206208LLIIFHINNYZXNM70
    Read  OCRB_Passport_Label3	            PHARG896GDOQCPR<<KFKFLVXVXV<<<<<<<<<<<<<<<<<\r\n089DB1J2L8ARG4408305F2206208LLI1F8IN36ZX7M18
    Read  OCRB_Passport_Label4	            PRBOLSBSBRRSSPP<<KXKXKX77XK<<UOUONM11NM<<<<<\r\nUA633KLIG3BOL8904159M25102841OFCCSSF58Z17M30
    Read  OCRB_Passport_Label5	            PGBWA1717447744<<8899666969<<<<<<<<<<<<<<<<<\r\n3336565997BWA8905178M25122991759562144383886
    Read  OCRB_Passport_Label6	            PKCOD5565653382<<1412561441<<<<<<<<<<<<<<<<<\r\n3996637113COD9203181F24102031442256358741288
    Read  OCRB_Passport_VN	                P<VNMNGUYEN<<PHUONG<THAO<<<<<<<<<<<<<<<<<<<<\r\nB3080919<5VNM8408233M1905065311746931<<<<<56
    Read  OCRB_Passport_Italian
    Read  OCRB_Passport_Greek	            P<GRCELLINAS<<GEORGIOS<<<<<<<<<<<<<<<<<<<<<<\r\nAE00000057GRC6504049M1208283<<<<<<<<<<<<<<00
    Read  OCRB_Postal_451_9_1               ${EMPTY}
    Read  OCRB_Postal_451_9_2               ${EMPTY}
Verify that Enable Italian Postal OCR_B the HH can't read Passport OCR_B but can read Postal OCR_B
    [Documentation]  Test case checks that OCR_B can be decoded succesfully. The OCR_B including OCR_B Passport & OCR_B Postal
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                       Expected result
    Send  $S,COCEN00000004,Ar	            $>,>,>
    Read  OCRB_Passport_Label1              ${EMPTY}
    Read  OCRB_Passport_Original Label      ${EMPTY}
    Read  OCRB_Postal_451_9_1	            000011114477< 451>
    Read  OCRB_Postal_451_9_2	            100880099001< 451>
    Read  OCRB_Postal_451_9_3	            000000896357< 451>
    Read  OCRB_Postal_451_9_4	            000005252449< 451>
    Read  OCRB_Postal_674_1.1.9.1_1	        <000001111111111102> 000011114477< 674>
    Read  OCRB_Postal_674_1.1.9.2_2	        <000001111111111102> 100880099001< 674>
