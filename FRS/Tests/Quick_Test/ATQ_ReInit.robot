*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}


*** Variables ***
${current_directory}         ${data_source}\\Quick_Test
*** test cases ***
ATQ_ReInit
    [Documentation]  This test case verify for decoding Postal Code
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                   Expected result
    EnterSP	                                        $>
    Send  $AE	                                    $>
    Send  Interface	                                $>
    Send  $CSNRM03	                                $>
    Send  $Ar	                                    $>
    EnterSP	                                        $>
    Send  $CIDCO01,As	                            $>,>
    Read  UPCA_123456789012	                        123456789012
    Send  $r02	                                    $>
    Read  UPCA_123456789012	                        A123456789012
    Send  $CC8EN00,As	                            $>,>
    Send  $r01	                                    $>
    Read  Code128_ABCabc
    Send  R
    ExitSP
    Read  UPCA_123456789012	                        A123456789012
    Read  Code128_ABCabc
ATQ_ReInit_GunWireless
    [Documentation]  This test case validates the r command can change and start using the new configuration settings in or out service port mode.
    ...   -	r01: The scanner replies to the command, exits Service Port Mode, and starts using the new configuration settings including the baud rate of the host interface.  The scanner stops the Service Port Mode indication
    ...   -	r02: The scanner replies to the command and starts using the new configuration settings while staying in Service Port Mode.  Reinitialization will only involve non-interface related configuration settings.  The baud rate will stay at the current Service Port Mode setting
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS  Wireless
    # Description                                   Expected result
    EnterSP	                                        $>
    Send  $AE	                                    $>
    Send  Interface	                                $>
    Send  $CSNRM03	                                $>
    Send  $Ar	                                    $>
    EnterSP	                                        $>
    Send  $ER3B	                                    [GUN] $>
    Send  $S	                                    [GUN] $>
    Send  $CIDCO01,As	                            [GUN] $>,>
    Read  UPCA_123456789012	                        123456789012
    Send  $r02	                                    [GUN] $>
    Read  UPCA_123456789012	                        A123456789012
    Send  $CC8EN00,As	                            [GUN] $>,>
    Send  $r01	                                    [GUN] $>
    Read  Code128_ABCabc
    Send  R
    Read  UPCA_123456789012	                        A123456789012
    Read  Code128_ABCabc


