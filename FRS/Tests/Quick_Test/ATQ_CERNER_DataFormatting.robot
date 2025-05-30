*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
*** Variables ***
${current_directory}         ${data_source}\\Quick_Test


*** test cases ***
ATQ_CERNER_DataFormatting
    [Documentation]  Verify if scanner can replace <GS> group separator by <|>
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                               Expected result
    Read  $P,CC8TF01,CLFCH1D7CFFFFFFFFFFFF,P_Datamatrix
    Read  EAN128_A_BCabc	                                    ]C1A|BCabc
    Read  EAN128_ABC_abc	                                    ]C1ABC|abc
    Read  EAN128_ABCab_c	                                    ]C1ABCab|c
    Read  Code128_ABC_x1dabc	                                ABC|abc
