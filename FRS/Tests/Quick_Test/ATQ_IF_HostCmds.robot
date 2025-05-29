*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}


*** Variables ***
${current_directory}         ${data_source}\\Quick_Test
*** test cases ***
ATQ_IF_HostCmds_Ignore Host Command
    [Documentation]  Verify that  in ignore host command (IFIH01), the system will NOT respond anything
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                   Expected result
    Send  $S,CIFIH01,Ar	            $>,>,>
    Send  B                         ${EMPTY}
    Send  D                         ${EMPTY}
    Send  F                         ${EMPTY}
    Send  E                         ${EMPTY}
    Send  R                         ${EMPTY}
    Send  C                         ${EMPTY}
    Send  t                         ${EMPTY}
    Send  s                         ${EMPTY}
    Send  \x01                      ${EMPTY}
    Send  \x34                      ${EMPTY}
    Send  \x07                      ${EMPTY}
    Send  i                         ${EMPTY}
    Send  h                         ${EMPTY}
    Read  UPCA_123456789012     	123456789012
ATQ_IF_HostCmds_Enable Host Command
    [Documentation]  Verify that  in ignore host command (IFIH01), the system will respond value
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                               Expected result
    Send  $S,CIFIH00,Ar	            $>,>,>
    Send  B
    Send  D
    Send  F
    Send  E
    Send  R
    Send  Cabcdefgh
    Send  t	                        \\n\\r!"#$%&\\'()*+,-./0123456789:;<=>?@\\n\\rABCDEFGHIJKLMNOPQRSTUVWXYZ[\\\\]^_`\\n\\rabcdefghijklmnopqrstuvwxyz{|}\\n
    Send  s	                        CONTAINS: Cabcdefgh
    Send  \x01
    Send  \x34
    Send  \x07
    Send  i	                        anyValue
    Send  h	                        anyValue
    Read  UPCA_123456789012     	123456789012
ATQ_IF_HostCmds_BeepOnBEL
    [Documentation]  Verify that  (BEL)  Scanning system  will beep
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                               Expected result
    Read  $P,CR2BB01,P
    Send  \x07          # Scanner will emit BEEP
ATQ_IF_HostCmds_Beep on NOT_ON_FILE
    [Documentation]  Verify that  Scanning system  will NOT emit beep
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                               Expected result
    Read  $P,CBPNF00,P
    Send  \x46          # Scanner will NOT emit BEEP
    Read  UPCA_123456789012     	${EMPTY}
    Send  E
    Read  UPCA_123456789012     	123456789012
ATQ_IF_HostCmds_Custom Enable_Disable Values
    [Documentation]  Verify that  (BEL)  Scanning system  will beep
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                               Expected result
    Read  $P,CR2DC08,P
    Read  $P,CR2EC09,P
    Send  \x46          # Good Read LED, will flash at a 1Hz rate
    Read  UPCA_123456789012     	${EMPTY}
    Send  E
    Read  UPCA_123456789012     	${EMPTY}
    Send  \x09          # Good Read LED will stop flashing
    Read  UPCA_123456789012     	123456789012
    Send  D
    Read  UPCA_123456789012     	123456789012