*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}


*** Variables ***
${current_directory}         ${data_source}\\Quick_Test
*** test cases ***
ATQ_GS1DigitalLink_ShareSameGTIN
    [Documentation]  This test case verify set of two more labels of GS1 1D Label, GS1 2D Label or Digimarc label that share the same GTIN value.
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                               Expected result
    Send  $S,CGDTM02,CGDBSFF,CDWEN03,C4BEN01,CXBEN01,Ar	        $>,>,>,>,>,>,>
    Read  GS1 label set 1_Dm Weblink
    Read  GS1 Label Set 2_QR weblink
    Read  GS1 Label Set 3_DM weblink
    Read  GS1 Label Set 4_QR weblink
    Read  GS1 Label Set 5_DM weblink
    Read  GS1 Label Set 6_DM without weblink
    Read  GS1 Label Set 7_QR without weblink
    Read  GS1 Label Set 8_DM without weblink
