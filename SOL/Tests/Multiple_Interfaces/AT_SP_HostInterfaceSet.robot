*** settings ***
Resource    ../../Resources/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
Suite Teardown  ExitSP
*** Variables ***
${current_directory}         ${CURDIR}\\DataSet


*** test cases ***
AT_SP_HostInterfaceSet_USB
    [Documentation]  This test case validates the H command can change Host interface type in service port mode
    ...            When set $HAXX, scanner will load factory defaults for new host interface type into the user configuration and current configuration
 	[Tags]      USB_COM  USB_CPS
    #Description                    Expected Result
    EnterSP	                        $>
    Send  $HA47,s	                $>,>
    Read  UPCA_123456789012	        123456789012
    EnterSP	                        $>
    Send  $CABEN00,Ar	            $>,>
    Read  UPCA_123456789012         NoRead
    EnterSP	                        $>
    Send  $HA00,CSNRM03,Ar	        $>,>,>
    Read  UPCA_123456789012	        123456789012
    Send  D
    Send  E
    Send  R
    EnterSP	$>
    Send  $HA4D,CSNRM03,s	        $>,>,>
    ChangeInterfaceTo  USB_CPS
    Read  UPCA_123456789012	        123456789012
    EnterSP	                        $>
    Send  $CABEN00,Ar	            $>,>
    Read  UPCA_123456789012         NoRead
    EnterSP	                        $>
    Send  $HA00,CSNRM03,Ar	        $>,>,>
    Read  UPCA_123456789012	        123456789012
    Send  D
    Send  E
    Send  R
    EnterSP	                        $>
    Send  $HA35	                    $>
    Send  $CSNRM03,Ar	            $>,>
    ChangeInterfaceTo  USB_KBD
    Read  UPCA_123456789012	        123456789012
    Read  $P,CSNRM03,P
    Read  $P,CABEN00,P
    Read  UPCA_123456789012         NoRead
    Read  $P,HA47,P
    Read  $P,Interface,P
    ChangeInterfaceTo  USB_COM
    [Teardown]  Read  $P,Interface,P
