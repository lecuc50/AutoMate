*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
*** Variables ***
${current_directory}         ${data_source}\\Quick_Test

*** test cases ***
ATQ_GS1DigitalLink_BuidTimeout
    [Documentation]  This test case verify the remaining labels of the GS1 label set must be read within timeout to be considered part of the set.
    ...  -	If GS1 Digital label set can be seen all within timeout Data will transmits to host immediately.
    ...   -	If GS1 Digital label set cannot be seen all within timeout  Data will wait the remaining label until timeout then will transmit to host.
    ...  -	If after timeout is expired but HH cannot see all labels in group label set -> Data will transmit to host what labels is seen.
    ...  Configuration: CI_GS1_DIGITAL_LINK_SET_BUILD_TIMEOUT
    ...  GDBS: min = 01, max = 0xFF (inscreate by  = 10ms). Default = 0x46 (700ms)
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                               Expected result
    Send  $S,cSNET,s					        $>,>05,>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBS46                              $>
    Send  $CGDTM01                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           CONTAINS: https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r OR/ CONTAINS: https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229 OR/ CONTAINS: 51000006011
    Read  Label_Set_2                           CONTAINS: https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229 OR/ CONTAINS: https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229 OR/ CONTAINS: 51000006011
    EnterSP                                     $>
    Send  $CGDBS01                              $>
    Send  $CGDTM02                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBS26                              $>
    Send  $CGDTM03                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBS66                              $>
    Send  $CGDTM03                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBS66                              $>
    Send  $CGDTM01                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBSFF                              $>
    Send  $CGDTM02                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBSFF                              $>
    Send  $CGDTM03                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
ATQ_GS1DigitalLink_BuidTimeout_SNRM03
    [Documentation]  Repeate on Flashing Mode
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                               Expected result
    Send  $S,CSNRM03,Ar					        $>,>,>,>
    Send  $S,cSNET,s					        $>,>05,>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBS46                              $>
    Send  $CGDTM01                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           CONTAINS: https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r OR/ CONTAINS: https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229 OR/ CONTAINS: 51000006011
    Read  Label_Set_2                           CONTAINS: https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229 OR/ CONTAINS: https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229 OR/ CONTAINS: 51000006011
    EnterSP                                     $>
    Send  $CGDBS01                              $>
    Send  $CGDTM02                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBS26                              $>
    Send  $CGDTM03                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBS66                              $>
    Send  $CGDTM03                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBS66                              $>
    Send  $CGDTM01                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBSFF                              $>
    Send  $CGDTM02                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBSFF                              $>
    Send  $CGDTM03                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
ATQ_GS1DigitalLink_BuidTimeout_SNRM04
    [Documentation]  Repeate on Always On
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                               Expected result
    Send  $S,CSNRM04,Ar					        $>,>,>,>
    Send  $S,cSNET,s					        $>,>05,>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBS46                              $>
    Send  $CGDTM01                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           CONTAINS: https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r OR/ CONTAINS: https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229 OR/ CONTAINS: 51000006011
    Read  Label_Set_2                           CONTAINS: https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229 OR/ CONTAINS: https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229 OR/ CONTAINS: 51000006011
    EnterSP                                     $>
    Send  $CGDBS01                              $>
    Send  $CGDTM02                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBS26                              $>
    Send  $CGDTM03                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBS66                              $>
    Send  $CGDTM03                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBS66                              $>
    Send  $CGDTM01                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBSFF                              $>
    Send  $CGDTM02                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBSFF                              $>
    Send  $CGDTM03                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
ATQ_GS1DigitalLink_BuidTimeout_SNRM05
    [Documentation]  Repeate on Stand Mode
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                               Expected result
    Send  $S,CSNRM05,Ar					        $>,>,>,>
    Send  $S,cSNET,s					        $>,>05,>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBS46                              $>
    Send  $CGDTM01                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           CONTAINS: https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r OR/ CONTAINS: https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229 OR/ CONTAINS: 51000006011
    Read  Label_Set_2                           CONTAINS: https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229 OR/ CONTAINS: https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229 OR/ CONTAINS: 51000006011
    EnterSP                                     $>
    Send  $CGDBS01                              $>
    Send  $CGDTM02                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBS26                              $>
    Send  $CGDTM03                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBS66                              $>
    Send  $CGDTM03                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBS66                              $>
    Send  $CGDTM01                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBSFF                              $>
    Send  $CGDTM02                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBSFF                              $>
    Send  $CGDTM03                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
ATQ_GS1DigitalLink_BuidTimeout_SNRM00
    [Documentation]  Repeate on Triggier Single
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                               Expected result
    Send  $S,CSNRM00,Ar					        $>,>,>,>
    SetSoftTrigger    On
    Send  $S,cSNET,s					        $>,>05,>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBS46                              $>
    Send  $CGDTM01                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           CONTAINS: https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r OR/ CONTAINS: https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229 OR/ CONTAINS: 51000006011
    Read  Label_Set_2                           CONTAINS: https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229 OR/ CONTAINS: https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229 OR/ CONTAINS: 51000006011
    EnterSP                                     $>
    Send  $CGDBS01                              $>
    Send  $CGDTM02                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBS26                              $>
    Send  $CGDTM03                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBS66                              $>
    Send  $CGDTM03                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBS66                              $>
    Send  $CGDTM01                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBSFF                              $>
    Send  $CGDTM02                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBSFF                              $>
    Send  $CGDTM03                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    SetSoftTrigger  Off
ATQ_GS1DigitalLink_BuidTimeout_SNRM01
    [Documentation]  Repeate on Triggier Pulse
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                               Expected result
    Send  $S,CSNRM01,Ar					        $>,>,>,>
    SetSoftTrigger    On
    Send  $S,cSNET,s					        $>,>05,>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBS46                              $>
    Send  $CGDTM01                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           CONTAINS: https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r OR/ CONTAINS: https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229 OR/ CONTAINS: 51000006011
    Read  Label_Set_2                           CONTAINS: https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229 OR/ CONTAINS: https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229 OR/ CONTAINS: 51000006011
    EnterSP                                     $>
    Send  $CGDBS01                              $>
    Send  $CGDTM02                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBS26                              $>
    Send  $CGDTM03                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBS66                              $>
    Send  $CGDTM03                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBS66                              $>
    Send  $CGDTM01                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBSFF                              $>
    Send  $CGDTM02                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBSFF                              $>
    Send  $CGDTM03                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    SetSoftTrigger  Off
ATQ_GS1DigitalLink_BuidTimeout_SNRM02
    [Documentation]  Repeate on Triggier Hold
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                               Expected result
    Send  $S,CSNRM02,Ar					        $>,>,>,>
    SetSoftTrigger    On
    Send  $S,cSNET,s					        $>,>05,>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBS46                              $>
    Send  $CGDTM01                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           CONTAINS: https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r OR/ CONTAINS: https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229 OR/ CONTAINS: 51000006011
    Read  Label_Set_2                           CONTAINS: https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229 OR/ CONTAINS: https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229 OR/ CONTAINS: 51000006011
    EnterSP                                     $>
    Send  $CGDBS01                              $>
    Send  $CGDTM02                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBS26                              $>
    Send  $CGDTM03                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBS66                              $>
    Send  $CGDTM03                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBS66                              $>
    Send  $CGDTM01                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBSFF                              $>
    Send  $CGDTM02                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    EnterSP                                     $>
    Send  $CGDBSFF                              $>
    Send  $CGDTM03                              $>
    Send  $Ar                                   $>
    Read  Label_Set_1                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    Read  Label_Set_2                           https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\rhttps://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229\r051000006011
    SetSoftTrigger  Off
