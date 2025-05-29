*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
Suite Teardown  Run Keywords   ExitSP
...             AND   ClosePort
*** Variables ***
${current_directory}         ${data_source}\\Service_Port_Mode


*** test cases ***
AT_SP_EnterSPWhenDisScanner
    [Documentation]  On receiving an enter service port host command while in scanner active, or scanner disabled mode, the software shall activate the service port.
    ...   - On entry into service port, the SW shall enable the scanner to decode labels if not already enabled.
    ...   - On detecting a service port enable signal while in scanner disabled mode, the software shall exit scanner disabled mode and activate the service port.
    [Tags]      RS232_STD    USB_COM     USB_CPS
    #Description	        Expected result
    Send  D
    EnterSP	                    $>
    Send  $cIDCO	            $>00
    Send  $CIDCO01	            $>
    Send  $Ar	                $>
    Read  UPCA_123456789012	    A123456789012

AT_SP_EnterSPWhenDisScanner
    [Documentation]  On receiving an enter service port host command while in scanner active, or scanner disabled mode, the software shall activate the service port.
    ...   - On entry into service port, the SW shall enable the scanner to decode labels if not already enabled.
    ...   - On detecting a service port enable signal while in scanner disabled mode, the software shall exit scanner disabled mode and activate the service port.
    [Tags]      RS232_WN
    #Description	        Expected result
    Send  D
    EnterSP	                    $>
    Send  $cIDCO	            $>01
    Send  $CIDCO00	            $>
    Send  $Ar	                $>
    Read  UPCA_123456789012	    0123456789012


AT_SP_EnterSPWhenDisScanner
    [Documentation]  On receiving an enter service port host command while in scanner active, or scanner disabled mode, the software shall activate the service port.
    ...   - On entry into service port, the SW shall enable the scanner to decode labels if not already enabled.
    ...   - On detecting a service port enable signal while in scanner disabled mode, the software shall exit scanner disabled mode and activate the service port.
    [Tags]      RS232_OPOS
    #Description	        Expected result
    Send  D
    EnterSP	                    $>
    Send  $cIDCO	            $>01
    Send  $CIDCO00	            $>
    Send  $Ar	                $>
    Read  UPCA_123456789012	    123456789012


