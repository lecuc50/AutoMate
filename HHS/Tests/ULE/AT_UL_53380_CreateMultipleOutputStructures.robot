*** settings ***
Documentation  See [https://rationalcld.dl.net/rm/web#action=com.ibm.rdm.web.pages.showArtifactPage&artifactURI=https%3A%2F%2Frationalcld.dl.net%2Frm%2Fresources%2FTX_xgS1uXpfHHX5yookQKvHnQ&oslc_config.context=https%3A%2F%2Frationalcld.dl.net%2Fgc%2Fconfiguration%2F533&componentURI=https%3A%2F%2Frationalcld.dl.net%2Frm%2Frm-projects%2F_m3Lwca_8Eeew0scXiQZ_Ag%2Fcomponents%2F_Hl8QMK_-Eeew0scXiQZ_Ag]|JAZZ requirement]
...  53380:  Create multiple output structures
...  The Label Edit script shall support the formation of multiple output structures from a given input structure.
Test Tags  LEO_C  PGS_C
Resource  ../Root_path.resource
Resource    ../../Keywords/Keywords.resource
Suite Setup     Run Keywords   Open Connection    ${INTERFACE_NAME}  ${COMPORT}
...             AND   Reading Mode    ${READING_MODE}
Suite Teardown  Close Connection 
*** Variables ***
${current_directory}         ${data_source}\\ULE


*** test cases ***
ULE Output Structures Default
    [Documentation]  OutStructureDefault.ule
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                               Expected result
    EnterSP                                             $>
    Send  $CLEEN01                                      $>
    Send  $U00000008554C4532007E0A0A                    $>
    Send  $U000800107B0A4F5554323D4F5554310A4F555433    $>
    Send  $U001800103D4F5554310A4F5554343D4F5554310A    $>
    Send  $U002800104F5554353D4F5554310A4F5554322E44    $>
    Send  $U003800106174613D225C6E4F5554325C6E220A4F    $>
    Send  $U004800105554332E446174613D224F5554335C6E    $>
    Send  $U00580010220A4F5554342E446174613D224F5554    $>
    Send  $U00680010345C6E220A4F5554352E446174613D22    $>
    Send  $U0078000C4F5554355C6E220A7D0A0A0A            $>
    Send  $Ar                                           $>
    Read  Code128_ABCabc                                ABCabc\\r\\nOUT2\\nOUT3\\nOUT4\\nOUT5\\n

ULE Output Structures Default
    [Documentation]  OutStructureDefault.ule
    [Tags]      USB_KBD  USB_KBD_ALT
    # Description                               Expected result
    Read  $P,CLEEN01,P
    Read  OutStructureDefault_ULE_LP
    Read  Code128_ABCabc                         ABCabc\r\n\r\nOUT2\r\nOUT3\r\nOUT4\r\nOUT5\r\n

ULE Output Structures Default Enable AIM ID
    [Documentation]  OutStructureDefault.ule
    ...  Verify that AIM ID is displayed when enalbe
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                               Expected result
    EnterSP                                             $>
    Send  $CLEEN01                                      $>
    Send  $U00000008554C4532007E0A0A                    $>
    Send  $U000800107B0A4F5554323D4F5554310A4F555433    $>
    Send  $U001800103D4F5554310A4F5554343D4F5554310A    $>
    Send  $U002800104F5554353D4F5554310A4F5554322E44    $>
    Send  $U003800106174613D225C6E4F5554325C6E220A4F    $>
    Send  $U004800105554332E446174613D224F5554335C6E    $>
    Send  $U00580010220A4F5554342E446174613D224F5554    $>
    Send  $U00680010345C6E220A4F5554352E446174613D22    $>
    Send  $U0078000C4F5554355C6E220A7D0A0A0A            $>
    Send  $Ar                                           $>
    Send  $S,CAIEN01,Ar                                 $>,>,>
    Read  Code128_ABCabc                                ]C0ABCabc\\r\\nOUT2\\nOUT3\\nOUT4\\nOUT5\\n

ULE Output Structures Default Enable AIM ID
    [Documentation]  OutStructureDefault.ule
    ...  Verify that AIM ID is displayed when enalbe
    [Tags]      USB_KBD  USB_KBD_ALT
    # Description                               Expected result
    Read  $P,CLEEN01,P
    Read  OutStructureDefault_ULE_LP
    Read  $P,CAIEN01,P
    Read  Code128_ABCabc                         ABCabc\r\n\r\nOUT2\r\nOUT3\r\nOUT4\r\nOUT5\r\n


ULE Output Structures Default DoSLF
    [Documentation]  OutputStructuresDoSLF.ule
    ...  Verify that AIM ID is displayed when enalbe
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                               Expected result
    EnterSP                                             $>
    Send  $CLEEN01                                      $>
    Send  $U00000008554C453200BA0A0A                    $>
    Send  $U000800107B0A4F5554323D4F5554310A4F555433    $>
    Send  $U001800103D4F5554310A4F5554343D4F5554310A    $>
    Send  $U002800104F5554353D4F5554310A4F5554322E44    $>
    Send  $U003800106174613D225C6E4F5554325C6E220A4F    $>
    Send  $U004800105554332E446174613D224F5554335C6E    $>
    Send  $U00580010220A4F5554342E446174613D224F5554    $>
    Send  $U00680010345C6E220A4F5554352E446174613D22    $>
    Send  $U007800104F5554355C6E220A446F534C46284F55    $>
    Send  $U008800105431290A446F534C46284F555432290A    $>
    Send  $U00980010446F534C46284F555433290A446F534C    $>
    Send  $U00A8001046284F555434290A446F534C46284F55    $>
    Send  $U00B800085435290A7D0A0A0A                    $>
    ExitSP                                              $>
    Send  $S,CAIEN01,Ar                                 $>,>,>
    Read  Code128_ABCabc                                ]C0ABCabc\\r]C0\\nOUT2\\n\\r]C0OUT3\\n\\r]C0OUT4\\n\\r]C0OUT5\\n\\r


ULE Output Structures Default DoSLF
    [Documentation]  OutputStructuresDoSLF.ule
    ...  Verify that AIM ID is displayed when enalbe
    [Tags]      USB_KBD  USB_KBD_ALT
    # Description                               Expected result
    Read  $P,CLEEN01,P
    Read  OutputStructuresDoSLF_ULE_LP
    Read  $P,CAIEN01,P
    Read  Code128_ABCabc                         ]C0ABCabc\r]C0\nOUT2\n\r]C0OUT3\n\r]C0OUT4\n\r]C0OUT5\n\r

ULE Output Structures Default NoSLF
    [Documentation]  OutputStructuresNoSLF.ule
    ...  Verify that AIM ID is not displayed when enalbe
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                               Expected result
    EnterSP                                             $>
    Send  $CLEEN01                                      $>
    Send  $U00000008554C4532008A0A0A                    $>
    Send  $U000800107B0A4F5554323D4F5554310A4F555433    $>
    Send  $U001800103D4F5554310A4F5554343D4F5554310A    $>
    Send  $U002800104F5554353D4F5554310A4F5554322E44    $>
    Send  $U003800106174613D225C6E4F5554325C6E220A4F    $>
    Send  $U004800105554332E446174613D224F5554335C6E    $>
    Send  $U00580010220A4F5554342E446174613D224F5554    $>
    Send  $U00680010345C6E220A4F5554352E446174613D22    $>
    Send  $U007800104F5554355C6E220A4E6F534C46284F55    $>
    Send  $U008800085431290A7D0A0A0A                    $>
    Send  $S,CAIEN01,Ar                                 $>,>,>
    Read  Code128_ABCabc                                ABCabc\\nOUT2\\nOUT3\\nOUT4\\nOUT5\\n
