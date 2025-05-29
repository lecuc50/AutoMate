*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
*** Variables ***
${current_directory}         ${data_source}\\Quick_Test

*** test cases ***
ATQ_DefaultUSBIF_Pegasus
    [Documentation]  Check default interface with USB cable is usually USB-KBD. But it’s USB-OEM for Columbus 4010 or QW2121 with external flash
    [Tags]      USB_COM   USB_CPS  PGS_C
    # Description                               Expected result
    EnterSP	                                     $>
    Send  $AE	                                 $>
    Send  $hA	                                 $>35
    Send  $Ae	                                 $>
    Send  $hA	                                 $>35
    Send  Interface	                             $>
    Send  $Ar	                                 $>
ATQ_DefaultUSBIF_Leonardo
    [Documentation]  Check default interface with USB cable is usually USB-KBD. But it’s USB-OEM for Columbus 4010 or QW2121 with external flash
    [Tags]      USB_COM   USB_CPS  LEO_C
    # Description                               Expected result
    EnterSP	                                     $>
    Send  $AE	                                 $>
    Send  $hA	                                 $>47
    Send  $Ae	                                 $>
    Send  $hA	                                 $>47
    Send  Interface	                             $>
    Send  $Ar	                                 $>
