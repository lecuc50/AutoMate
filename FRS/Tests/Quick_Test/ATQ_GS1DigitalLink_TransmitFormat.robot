*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}


*** Variables ***
${current_directory}         ${data_source}\\Quick_Test
*** test cases ***
ATQ_GS1DigitalLink_TransmitFormat
    [Documentation]  This test case verify a field to format GS1 2D labels in the Label Set that before transmitted.
	...  Configuation: CI_GS1_DIGITAL_LINK_2D_TRANSMIT_FORMAT.
    ...  GDTF:	00=Send as its original label type, including web address part (default)
    ...  01=Send the content its original label type, stripping web address part
    ...  02=Send the content as GS1 Databar-14 containing only GTIN data portion, changing also Label ID and AIM ID if needed.
    ...  03=Send the GTIN data portion in simplest form as Databar-14, EAN13, UPCA, EAN8
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                               Expected result
    Send  $S,CGDTM03,Ar	                                        $>,>,>
    Send  $S,cGDTF,Ar	                                        $>,>00,>
    Read  GS1 Digital Link Label Set_QRCode         	        https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Send  $S,CGDTF01,Ar	                                        $>,>,>
    Read  GS1 Digital Link Label Set_Datamatrix     	            01000000006162181021260{GS}172301013103001134
    Send  $S,CGDTF02,Ar	                                        $>,>,>
    Read  GS1 Digital Link Label Set_GS1 Databar-14 containing only GTIN data portion   	                    0100000000616218
    Send  $S,CGDTF03,Ar	                                        $>,>,>
    Read  GS1 Digital Link Label Set_GTIN data portion in simplest form as Databar-14_ EAN13_UPCA_EAN8      	5400141060218
