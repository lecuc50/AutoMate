*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}


*** Variables ***
${current_directory}         ${data_source}\\Quick_Test
*** test cases ***
ATQ_OCR_Inverted
    [Documentation]  Check scanner can decode OCR inverted
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                                   Expected result
    Read  $P,CIPNR02,P
    Read  $P,COCEN00000007,P
    Read  $P,CIPLR02,P
    Read  EU Identify card_INVERSE
    Read  EU Identify card_INVERSE_Switzerland
    Read  EU Identify card_INVERSE_Switzerland_Basel
    Read  EU Identify card_INVERSE_Switzerland_Liestal
    Read  Passport OCR_INVERSE_LINASGEORGIOS
    Read  Passport OCR_INVERSE_KAMHEININ
    Read  Passport OCR_INVERSE_CHINA_ZHENGJIANYANGBEN
    Read  Passport OCR_INVERSE_Portuguesa_GARCAODEMAGALHAES
    Read  Passport OCR_INVERSE_CANADA_JOHNTIMOTHY
    Read  Passport OCR_INVERSE_Thailand_HAWANNATIM
    Read  Passport OCR_INVERSE_CHINA_HUNGKWOKSUM
    Read  Passport OCR_INVERSE_Thailand_THATHONGPLEW
    Read  Passport OCR_INVERSE_SERBIA_TESTMILICA
    Read  Passport OCR_INVERSE_CZECH_PECIMENVZOR
    Read  Passport OCR_INVERSE_USA_TRAVELERHAPPY
    Read  Passport OCR_INVERSE_Bangladesd_DISLAMMDARIFUL
    Read  Passport OCR_INVERSE_VIETNAM_TRANNGOCBAO
    Read  Passport OCR_INVERSE_INDONESIA_LENGKAPNAMA
    Read  PostalOCR_INVERSE
    Read  $P,COCEN00000018,P
    Read  Swiss Driver License_INVERSE
    Read  ITB Bank_INVERSE_1
    Read  ITB Bank_INVERSE_2
    Read  $P,COCEN00000020,P
    Read  French ID Card_INVERSE
