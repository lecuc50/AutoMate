*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
*** Variables ***
${current_directory}         ${data_source}\\Quick_Test

*** test cases ***
ATQ_EANbelowDatamatrix
    [Documentation]  Can read Datamatrix when the EAN box overlaps the DM (EAN13 below DM)
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                           Expected result
    Send  $S,CIDCO01,CAIEN01,CDMEN01,CSNPM01,Ar	            $>,>,>,>,>,>
    Read  EANbelowDatamatrix_1	                            Dg]d20105415098011978216PT9QUXNQHBS\\x1d240FA074824.09
    Read  EANbelowDatamatrix_2	                            Dg]d2010541509801203621LC5WCZH62WPF\\x1d240FA074791.09
    Read  EANbelowDatamatrix_3	                            Dg]d2010541509801197821STC65A660KD0\\x1d240FA074824.09
