*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
*** Variables ***
${current_directory}         ${data_source}\\Quick_Test

*** test cases ***
ATQ_DotCode_Default
    [Documentation]  Verify scanner can’t read this label because default dotcode is disable
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                               Expected result
    Read  Label1_Dotcode						                ${EMPTY}
ATQ_DotCode_Enable
    [Documentation]  Verify scanner can read Dot Code label
    ...  Default variable length control, length is from 3 to 50 characters
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                               Expected result
    Read  $P,CDCEN01,P
    Read  Dotcode_Label_Dot_Code_100_Character_Create_By_HHSTest_Team_Datalogic_VietNam_Company_At_218PM_19-July_2018  ${EMPTY}
    Read  Dotcode_Label Dot Code Standard						Label Dot Code Standard
    Read  Dotcode_00112233445566778899						    00112233445566778899
    Read  Dotcode_Label Dot Code Rotation 90					Label Dot Code Rotation 90
    Read  Dotcode_Label Dot Code Rectangle						Label Dot Code Rectangle
    Read  Dotcode_Dot Code Rotation 180						    Label Dot Code Rotation 180
    Read  Dotcode_Label Dot Code Circles						Label Dot Code Circles
    Read  Dotcode_Label Dot Code Rotation 270					Label Dot Code Rotation 270
    Read  Dotcode_Label Dot Code Rounded Rectangle				Label Dot Code Rounded Rectangle<space>
ATQ_DotCode_Enable_AIMID
    [Documentation]  Verify scanner can read Dot Code label and display correct AIM ID
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                               Expected result
    EnterSP                                                     $>
    Send  $CDCEN01                                              $>
    Send  $CDCAI01                                              $>
    Send  $Ar                                                   $>
    Read  Dot Code Standard no ECI_Datalogic					]J0Datalogic
    Read  Dot Code Standard with ECI_Datalogic					]J3\\\\000001Datalogic
    Read  Dot Code Standard no ECI_123456						]J1123456
    Read  Dot Code Standard with ECI_123456						]J3\\\\000001123456
    Read  Dot Code GS1 no ECI_19Datalogic						]J119Datalogic
    Read  Dot Code GS1 with ECI_19Datalogic						]J419\\\\000001Datalogic
    Read  Dot Code Industry no ECI_Datalogic					]J220Datalogic              #Can read
    Read  Dot Code Industry with ECI_Datalogic					]J520\\\\000001Datalogic
    Read  Dot Code Industry no ECI_123456						]J2A123456                  #Can read
    Read  Dot Code Industry with ECI_123456						]J5A\\\\000001123456
ATQ_DotCode_Enable_Golbal_AIMID_LabelID
    [Documentation]  Verify scanner can read Dot Code label and display correct AIM ID and label ID
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                               Expected result
    Read  $P,CIDCO01,P
    Read  $P,CAIEN01,P
    Read  $P,CDCL10001,P
    Read  $P,CDCL2087A,P
    Read  $P,CDCAI00,P
    Read  $P,CDCID405000,P
    Read  Dot Code 2 character_Ab						        @P]J0Ab                 #Can read
    Read  Dotcode_Label_Dot_Code_100_Character_Create_By_HHSTest_Team_Datalogic_VietNam_Company_At_218PM_19-July_2018						    @P]J0Label_Dot_Code_100_Character_Create_By_HHSTest_Team_Datalogic_VietNam_Company_At_2:18PM_19-July_2018
    Read  Dot code 2170 characters						        $P]J10123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789
ATQ_DotCode_Enable_Golbal_AIMID_LabelID_FixLength
    [Documentation]  Verify scanner can read Dot Code label 100 characters
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                               Expected result
    Read  $P,CIDCO01,P
    Read  $P,CAIEN01,P
    Read  $P,CDCL10001,P
    Read  $P,CDCID405000,P
    Read  $P,CDCLC01,P
    Read  $P,CDCL20064,P
    Read  Dot Code 2 character_Ab						        ${EMPTY}
    Read  Dotcode_Label_Dot_Code_100_Character_Create_By_HHSTest_Team_Datalogic_VietNam_Company_At_218PM_19-July_2018						    @P]J0Label_Dot_Code_100_Character_Create_By_HHSTest_Team_Datalogic_VietNam_Company_At_2:18PM_19-July_2018
    Read  Dot code 2170 characters						        ${EMPTY}
