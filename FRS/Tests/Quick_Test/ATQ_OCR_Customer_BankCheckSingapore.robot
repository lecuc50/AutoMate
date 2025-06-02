*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}


*** Variables ***
${current_directory}         ${data_source}\\Quick_Test
*** test cases ***
ATQ_OCR_Customer_BankCheckSingapore
    [Documentation]  Check scanner can read Bank Check Singapore with MICR font (defect 107579)
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                                   Expected result
    Send  $S,COCEN10000000,G0162414E4E20414E4E4E4E4E4E41204E4E414E4E4E4E4E41204E4E4E4E4E4E4E4E4E4E41204E4E0D0D,Ar	    $>,>,>,>
    Read  OCR_1	                                                    A10 C900767C 24D12344A 4380082250C 12
    Read  OCR_2	                                                    A44 C505372C 27D14178A 0050052951C 11
