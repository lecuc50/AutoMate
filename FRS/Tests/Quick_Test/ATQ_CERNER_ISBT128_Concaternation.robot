*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
*** Variables ***
${current_directory}         ${data_source}\\Quick_Test


*** test cases ***
ATQ_CERNER_ISBT128_Concaternation
    [Documentation]  Verify if scanner can read all ISBT-128 test labels sent from CERNER with special setting for them.
    ...   Requirement from CERNER: Barcode scanners must have the ability to substitute or add data within the data stream.
    ...   Example: Prescription Drug Labels: The scanned barcode reads data as a GS1-128 symbology formatted with a GTIN 12
    ...   data structure containing the National Drug Code (NDC), expiration date and lot information
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                           Expected result
    #Read  $P,CI8CE01,CI8L00102,CI8L10304,CI8L20103,CI8L30113,CI8L41112,CI8L51516,CI8L61819,CI8L70207,P
    EnterSP                                 $>
    Send  $CI8CE01                          $>
    Send  $CI8L00102                        $>
    Send  $CI8L10304                        $>
    Send  $CI8L20103                        $>
    Send  $CI8L30113                        $>
    Send  $CI8L41112                        $>
    Send  $CI8L51516                        $>
    Send  $CI8L61819                        $>
    Send  $CI8L70207                        $>
    Send  $Ar                               $>
    Read  ISBT128_label1	                =K98765432112345=%3344
    Read  ISBT128_label2	                =<O8765Y22=>015059
    Read  ISBT128_label3	                =K98765432112345=<O8765Y22
    Read  ISBT128_label4	                =K98765432112345=;A1B234567899876543212
    Read  ISBT128_label5	                =)A1B2C3D4E5&)A1B2C3D4E5
    Read  ISBT128_label6	                =-A1B2C3D4E5&-A1B2C3D4E5
    Read  ISBT128_label7	                =#0019860721&#0004A1B2
