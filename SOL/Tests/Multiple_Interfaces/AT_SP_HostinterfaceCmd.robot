*** settings ***
Resource    ../../Resources/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
Suite Teardown  ExitSP
*** Variables ***
${current_directory}         ${CURDIR}\\DataSet


*** test cases ***
 AT_SP_HostinterfaceCmd_USB_COM
    [Documentation]  verify command: SSC_Set_Host_Interface_Type in service port mode specification
    [Tags]      USB_COM
    #Description                                                    Expected Result
    Send  $S,CC9EN01,Ar                                                  $>,>,>
    EnterSP	                                                             $>
    Send  $HA4D	                                                         $>
    Send  $Ar	                                                         $>
    ChangeInterfaceTo  USB_CPS
    EnterSP	                                                             $>
    Send  $cC9EN	                                                     $>00
    Send  $CLFPR4545000000000000000000000000000000000000,AS	             $>,>
    ExitSP	                                                             $>
    EnterSP	                                                             $>
    Send  $HA00,Ar	                                                     $>,>
    EnterSP	                                                             $>
    Send  $HA47,CSNRM03,AR                                               $>,>,>
    ChangeInterfaceTo  USB_COM
    Read  Code93_ABCDEF	                                                 ${EMPTY}
    EnterSP	                                                             $>
    Send  $HA4D	                                                         $>
    ExitSP	                                                             $>
    ChangeInterfaceTo  USB_CPS
    Read  UPCA_123456789012	                                             EE123456789012
    Send  $S,HA47,Ar	                                                 $>,>,>
    ChangeInterfaceTo  USB_CPS
