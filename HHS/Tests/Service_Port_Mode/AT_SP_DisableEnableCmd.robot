*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
Suite Teardown  Run Keywords   ExitSP
...             AND   ClosePort
*** Variables ***
${current_directory}         ${data_source}\\Service_Port_Mode


*** test cases ***
AT_SP_DisableEnableCmd
    [Documentation]  This test case run the precondition for the robot test in Eugence. It should take about 15 min to test.
    ...  Verify that after 15 mins sending E/D the HH still work good without reset
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS   USB_COM      USB_CPS
    EnterSP	                $>
    Send  $AR	            $>
    Send  Interface	        $>
    Send  $CSNDR02	        $>
    Send  $CBPVO00	        $>
    Send  $CSNRM04	        $>
    Send  $AR	            $>
    Send  $Er	            $>
    ExitSP	                $>
    Display   UPCA_123456789012
    FOR    ${counter}    IN RANGE    0    900000    1
        Send    E
        Keywords.WaitMiliSecond    100
        Send    D
        Keywords.WaitMiliSecond     100
    END
    CheckReset	 0

AT_SP_DisableEnableCmd
    [Documentation]  This test case run the precondition for the robot test in Eugence. It should take about 15 min to test.
    ...  Verify that after 15 mins sending E/D the HH still work good without reset
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS   USB_COM      USB_CPS   Cordless
    #Description                    Expected result
    EnterSP	                        $>
    Send  $AR	                    $>
    Send  Interface	                $>
    Send  $CSNDR02	                $>
    Send  $CBPVO00	                $>
    Send  $CSNRM04	                $>
    Send  $AR	                    $>
    Send  $Er	                    $>
    ExitSP	                        $>
    Send  ${brigde_mode}	        [GUN] $>
    Send  $S	                    [GUN] $>
    Send  $AR	                    [GUN] $>
    Send  $Er	                    [GUN] $>
    Send  $s	                    [GUN] $>
    Send  $ER0	                    $>
    ExitSP	                        $>
    Display   UPCA_123456789012
    FOR    ${counter}    IN RANGE    0    900000    1
        Send    E
        WaitSecond    0.1
        Send    D
        WaitSecond    0.1
    END
    CheckReset	 0
