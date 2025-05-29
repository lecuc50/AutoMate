*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
Suite Teardown  Run Keywords   ExitSP
...             AND   ClosePort
*** Variables ***
${current_directory}         ${data_source}\\Service_Port_Mode

*** test cases ***
AT_SP_EnterByLabelProg
    [Documentation]   Verify that user can Enter Service Port Mode in all interface by label programming
    [Tags]      RS232_STD  RS232_WN  RS232_OPOS  USB_COM   USB_CPS  Corded
    #Description                    Expected result
    Read  $S
    ChangeBaud   115200
    ChangeParity    None
    Send   $CABEN01,Ar	            $>,>
    Read   $S
    ChangeBaud   115200
    ChangeParity    None
    Send   $cABEN	                $>01
    Send   Interface	            $>
    ExitSP
    Read   UPCA_123456789012	    CONTAINS: 123456789012

AT_SP_EnterByLabelProg_USBKBD
    [Documentation]   This test verify the user can enter service port via scanning label on USB_KBD interface
    [Tags]      USB_KBD  Corded
    Read    $S
    Connect With COM port  ${COMPORT}
    Send    $cABEN	    $>01
    Send    $HA47	    $>
    Send    $Ar	        $>

AT_SP_EnterByLabelProg_USBKBDALT
    [Documentation]   This test verify the user can enter service port via scanning label on USB_KBD_ALT interface
    [Tags]      USB_KBD_ALT  Corded
    Read    $S
    Connect With COM port  ${COMPORT}
    Send    $cABEN	    $>01
    Send    $HA47	    $>
    Send    $Ar	        $>

AT_SP_EnterByLabelProg_StressTest
    [Documentation]   Verify that after send $! many times HH can enter SP by label programing
    [Tags]      RS232_STD  RS232_WN  RS232_OPOS  USB_COM   USB_CPS  Corded
    Send   $!	${RevA_Version_Base}
    Send   $!	${RevA_Version_Base}
    Send   $!	${RevA_Version_Base}
    Send   $!	${RevA_Version_Base}
    Send   $!	${RevA_Version_Base}
    Send   $!	${RevA_Version_Base}
    Send   $!	${RevA_Version_Base}
    Send   $!	${RevA_Version_Base}
    Send   $!	${RevA_Version_Base}
    Send   $!	${RevA_Version_Base}
    Send   $!	${RevA_Version_Base}
    Read   $S
    ChangeBaud   115200
    ChangeParity    None
    Send   $cABEN	$>01
    ExitSP

