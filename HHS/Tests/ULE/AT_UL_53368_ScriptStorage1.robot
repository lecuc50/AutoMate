*** settings ***
Documentation  See [https://rationalcld.dl.net/rm/web#action=com.ibm.rdm.web.pages.showArtifactPage&artifactURI=https%3A%2F%2Frationalcld.dl.net%2Frm%2Fresources%2FTX_tOVeBmIKFU1AVWtBzIbWZQ&oslc_config.context=https%3A%2F%2Frationalcld.dl.net%2Fgc%2Fconfiguration%2F533&componentURI=https%3A%2F%2Frationalcld.dl.net%2Frm%2Frm-projects%2F_m3Lwca_8Eeew0scXiQZ_Ag%2Fcomponents%2F_Hl8QMK_-Eeew0scXiQZ_Ag]|JAZZ requirement]
...  53368:  Script storage
...  The script shall be stored in non-volatile memory.
Test Tags  LEO_C  PGS_C
Resource  ../Root_path.resource
Resource    ${root}Keywords/Keywords.resource
Suite Setup     Run Keywords   Open Connection    ${INTERFACE_NAME}  ${COMPORT}
...             AND   Reading Mode    ${READING_MODE}
Suite Teardown  Close Connection


*** Variables ***
${current_directory}         ${data_source}\\ULE


*** test cases ***
ULE by service port mode
    [Documentation]  Verify that when the HH reset, ULE script still in non-volatile memory and no disable
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                               Expected result
    EnterSP                                             $>
    Send  $CLEEN01                                      $>
    Send  $U00000008554C4532001A0A0A                    $>
    Send  $U000800107B0A4F5554312E446174613D22554C45    $>
    Send  $U001800082054657374220A7D                    $>
    Send  $CABEN00                                      $>
    Send  $Ar                                           $>
    Read  Code128_ABCabc                                ULE Test
    Send  R
    Read  Code128_ABCabc                                ULE Test