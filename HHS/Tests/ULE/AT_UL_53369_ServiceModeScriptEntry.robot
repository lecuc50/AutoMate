*** settings ***
Documentation  See [https://rationalcld.dl.net/rm/web#action=com.ibm.rdm.web.pages.showArtifactPage&artifactURI=https%3A%2F%2Frationalcld.dl.net%2Frm%2Fresources%2FTX_QGbrWWwpGOmRQxhWBV7oRQ&oslc_config.context=https%3A%2F%2Frationalcld.dl.net%2Fgc%2Fconfiguration%2F533&componentURI=https%3A%2F%2Frationalcld.dl.net%2Frm%2Frm-projects%2F_m3Lwca_8Eeew0scXiQZ_Ag%2Fcomponents%2F_Hl8QMK_-Eeew0scXiQZ_Ag]|JAZZ requirement]
...  53369: Service Mode Script Entry
...  The SW shall support a means to enter the script using service mode commands
Test Tags  LEO_C  PGS_C
Resource  ../Root_path.resource
Resource    ../../Keywords/Keywords.resource
Suite Setup     Run Keywords   Open Connection    ${INTERFACE_NAME}  ${COMPORT}
...             AND   Reading Mode    ${READING_MODE}
#Suite Teardown  Close Connection
*** Variables ***
${current_directory}         ${data_source}\\ULE


*** test cases ***
ULE by service port mode
    [Documentation]  Verify that the HH can apply ULE by service port mode
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS  USB_KBD  USB_KBD_ALT
    # Description                               Expected result
    EnterSP                                             $>
    Send  $CLEEN01                                      $>
    Send  $U00000008554C4532001A0A0A                    $>
    Send  $U000800107B0A4F5554312E446174613D22554C45    $>
    Send  $U001800082054657374220A7D                    $>
    Send  $CABEN01                                      $>
    Send  $Ar                                           $>
    Read  Code128_ABCabc                                ULE Test