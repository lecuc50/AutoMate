*** settings ***
Documentation  See [https://rationalcld.dl.net/rm/web#action=com.ibm.rdm.web.pages.showArtifactPage&artifactURI=https%3A%2F%2Frationalcld.dl.net%2Frm%2Fresources%2FTX_fl87zcW9FCmCyofpdKHpwQ&oslc_config.context=https%3A%2F%2Frationalcld.dl.net%2Fgc%2Fconfiguration%2F533&componentURI=https%3A%2F%2Frationalcld.dl.net%2Frm%2Frm-projects%2F_m3Lwca_8Eeew0scXiQZ_Ag%2Fcomponents%2F_Hl8QMK_-Eeew0scXiQZ_Ag]|JAZZ requirement]
...  53371: Script Delay support
...  The SW shall support the script feature of utilizing a time delay before or after a label transmission
Test Tags  LEO_C  PGS_C
Resource  ../Root_path.resource
Resource    ../../Keywords/Keywords.resource
Suite Setup     Run Keywords   Open Connection    ${INTERFACE_NAME}  ${COMPORT}
...             AND   Reading Mode    ${READING_MODE}
Suite Teardown  Close Connection 
*** Variables ***
${current_directory}         ${data_source}\\ULE


*** test cases ***
ULE Delay
    [Documentation]  OutStructureDelay.ule
    ...  Verify that the data transmission is delay
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                               Expected result
    EnterSP                                             $>
    Send  $CLEEN01                                      $>
    Send  $U00000008554C453200660A0A                    $>
    Send  $U000800107B0A4F5554323D4F5554310A4F555433    $>
    Send  $U001800103D4F5554310A44656C6179284F555431    $>
    Send  $U002800102C3130303030290A4F5554322E446174    $>
    Send  $U00380010613D225C6E4F5554325C6E220A44656C    $>
    Send  $U004800106179284F5554322C3130303030290A4F    $>
    Send  $U005800105554332E446174613D224F5554335C6E    $>
    Send  $U00680004220A7D0A                            $>
    Send  $Ar                                           $>
    Read  Code128_ABCabc                                ABCabc
    WaitMiliSecond    10000
    GetDataFromHost                                     \\nOUT2\\n
    WaitMiliSecond    10000
    GetDataFromHost                                     OUT3\\n

ULE Delay label programing
    [Documentation]  OutStructureDelay.ule
    ...  Verify that the data transmission is delay
    [Tags]      USB_CPS  USB_KBD  USB_KBD_ALT
    # Description                       Expected result
    Read  $P,CLEEN01,P
    Read  OutputStructuresDelay
    Read  Code128_ABCabc                                ABCabc
    WaitMiliSecond    10000
    GetDataFromHost                                     \nOUT2\n
    WaitMiliSecond    10000
    GetDataFromHost                                     OUT3\n

