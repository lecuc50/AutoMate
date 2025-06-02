*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
*** Variables ***
${current_directory}         ${data_source}\\Quick_Test

*** test cases ***
ATQ_CompareAEAndAe
    [Documentation]  After restoring default by $AE or $Ae,configuration value should be same between AE (USA) or Ae (European/Bologna) block,
    ...   except Label ID. It is scope of this TC (test tag which does not belong to label id type)
    ...   Label id values are defined in specific specification for each AE (USA) or Ae (European/Bologna) block.
    ...   This TC does not aim to test difference in values of label id tags through each interfaces- this is covered by auto test already.
    ...   However, it can be checked in hyperlinked spreadsheet below (but only in default interface, not go through each interface as in automation test)

    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                                               Expected result
    EnterSP	                                                                    $>
    Send  $AE	                                                                $>
    ${data1}=  Send  $a
    Send  $Ae	                                                                $>
    ${data2}=  Send  $a
    Send  Interface	                                                            $>
    Send  $Ar	                                                                $>
    CompareLabelIDAEAe    ${data1}    ${data2}
