*** settings ***
Documentation  See [https://rationalcld.dl.net/rm/web#action=com.ibm.rdm.web.pages.showArtifactPage&artifactURI=https%3A%2F%2Frationalcld.dl.net%2Frm%2Fresources%2FTX_nEjRwUFFGZL1dIEJk0hdWg&oslc_config.context=https%3A%2F%2Frationalcld.dl.net%2Fgc%2Fconfiguration%2F533&componentURI=https%3A%2F%2Frationalcld.dl.net%2Frm%2Frm-projects%2F_m3Lwca_8Eeew0scXiQZ_Ag%2Fcomponents%2F_Hl8QMK_-Eeew0scXiQZ_Ag]|JAZZ requirement]
...  53370: Programmign label script entry
...  The SW shall support a means to enter the script using programming labels
Test Tags  LEO_C  PGS_C
Resource  ../Root_path.resource
Resource    ../../Keywords/Keywords.resource
Suite Setup     Run Keywords   Open Connection    ${INTERFACE_NAME}  ${COMPORT}
...             AND   Reading Mode    ${READING_MODE}
Suite Teardown  Close Connection 
*** Variables ***
${current_directory}         ${data_source}\\ULE


*** test cases ***
ULE by label programing
    [Documentation]  Verify that the HH can apply ULE by label programing
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS  USB_KBD  USB_KBD_ALT
    # Description                       Expected result
    Read  $P,CLEEN01,P
    Read  ULE_LabelPrograming
    Read  Code128_ABCabc                ULE Test
