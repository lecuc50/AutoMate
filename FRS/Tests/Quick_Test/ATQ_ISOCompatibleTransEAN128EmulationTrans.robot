*** settings ***
Documentation  This test verifies the rules for ISO compatible transmission for UCC composites and EAN128 Emulation
...  This function dosen't support Pegasus
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
Test Tags   LEO_C  MKA_C  MKA_B  MKA_S


*** Variables ***
${current_directory}         ${data_source}\\Quick_Test


*** test cases ***
ATQ_ISOCompatibleTransEAN128EmulationTrans_Senario1
    [Documentation]  Rules for EAN/UCC Composites ISO compatible transmission (XX2D02 and XXEM00)
    ...  Expected result: (with AIM ID is enabled)
    ...  -	For UCC/EAN
    ...  •	Send 1D and 2D component as two distinct labels, each one with its own AIM ID
    ...  •	The 1D label has the same formatting of the base symbologies (i.e if the code is a UPCE composite, and AIMID is enabled, the 1D part will be expanded to EAN 13
    ...  •	AIMID of the 2D component is ]e0
    ...  -	For GS1_EAN128/GS1_Databar
    ...  •	Send as a single label
    ...  o	If GS1-EAN128, add GS at end of 1D component only if the last AI (Application Identifier) is variable
    ...  •	Use ]e0 as AIMID
    ...  •	There is no AIMID for the 2D component
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                           Expected result
    EnterSP	                                    $>
    Send  $CABEN01	                            $>
    Send  $CEBEN01	                            $>
    Send  $C8BEN01	                            $>
    Send  $C3BEN01	                            $>
    Send  $C4BEN01	                            $>
    Send  $CLBEN01	                            $>
    Send  $CXBEN01	                            $>
    Send  $C8B2D02	                            $>
    Send  $C3B2D02		                        $>
    Send  $CU82D02		                        $>
    Send  $CEB2D02		                        $>
    Send  $CAB2D02		                        $>
    Send  $C4B2D02		                        $>
    Send  $CLB2D02		                        $>
    Send  $CXB2D02		                        $>
    Send  $CAIEN01		                        $>
    Send  $C8CEM00		                        $>
    Send  $C3CEM00		                        $>
    Send  $CUCEM00		                        $>
    Send  $CECEM00		                        $>
    Send  $CACEM00		                        $>
    Send  $C4CEM00		                        $>
    Send  $CLCEM00		                        $>
    Send  $CXCEM00		                        $>
    Send  $Ar		                            $>
    Read  UPCA-COMP_CCA	                    ]E00123456789012\\r]e0This is CCA
    Read  UPCA-COMP_CCB_48	                ]E00123456789012\\r]e0This is CCB Long StringThis is CCB Long
    Read  UPCA-COMP-CCB_48	                ]E00123456789012\\r]e0This is CCB Long StringThis is CCB Long StringThis is CCB Long StringThis is CCB Long String
    Read  UPCE-COMP-CCA	                    ]E00023456000073\\r]e0This is CCA
    Read  UPCE-COMP-CCB _Greater_48     	]E00023456000073\\r]e0This is CCB Long StringThis is CCB LongCCB123456
    Read  UPCE-COMP-CCB _Smaler_48      	]E00023456000073\\r]e0This is CCB Long StringThis is
    Read  EAN8-COMP-CCA                 	]E412345670\\r]e0This is CCA
    Read  EAN8-COMP-CCB _Greater_48     	]E412345670\\r]e0This is CCB Long StringThis is CCB Long StringThis is CCB Long String
    Read  EAN8-COMP-CCB_Smaller_48      	]E412345670\\r]e0This is CCB Long StringThis is CCB
    Read  EAN13-COMP-CCA                	]E01234567890128\\r]e0This is CCA
    Read  EAN13-COMP-CCB_Greater_48     	]E01234567890128\\r]e0This is CCB Long StringThis is CCB Long StringThis is CCB Long String
    Read  EAN13-COMP-CCB_Smaller_48     	]E01234567890128\\r]e0This is CCB Long StringThis is CCB
    Read  EAN128-COMP-CCA               	]e0ABCabcThis is CCA
    Read  EAN128-COMP-CCB_Greater_48    	]e0ABCabcThis is CCB Long StringThis is CCB Long StringThis is CCB Long String
    Read  EAN128-COMP-CCB_Smaller_48    	]e0ABCabcThis is CCB Long StringThis is CCB
    Read  RSS14-COMP-CCA                	]e00100614141999996This is CCA
    Read  RSS14-COMP-CCB_Greater_48     	]e00100614141999996This is CCB Long StringThis is CCB Long StringThis is CCB Long String
    Read  RSS14-COMP-CCB_Smaller_48     	]e00100614141999996This is CCB Long StringThis is CCB
    Read  RSSEXP-COMP-CCA               	]e00100614141999996This is CCA
    Read  RSSEXP-COMP-CCB_Greate_48     	]e00100614141999996This is CCB Long StringThis is CCB Long StringThis is CCB Long String
    Read  RSSEXP-COMP-CCB_Smaler_48     	]e00100614141999996This is CCB Long StringThis is CCB
    Read  RSSLIM-COMP-CCA               	]e00100614141999996This is CCA
    Read  RSSLIM-COMP-CCB_Greater_48    	]e00100614141999996This is CCB Long StringThis is CCB Long StringThis is CCB Long String
    Read  RSSLIM-COMP-CCB_Smaller_48    	]e00100614141999996This is CCB Long StringThis is CCB
ATQ_ISOCompatibleTransEAN128EmulationTrans_Senario2
    [Documentation]  Scenario 2: Rules for EAN/UCC Composites ISO compatible transmission with EAN128 Emulation (XX2D02 and XXEM01)
    ...  Expected result: (with AIM ID is enabled)
    ...  -	For UCC/EAN
    ...  •	Send 1D component as a normal UPC/EAN composite
    ...  •	For 2D component
    ...  o	Split the string in substring less than 48 chars long. But do not split Application Identifies
    ...  o	Use ]C1 as AIM ID for those substrings
    ...  -	For GS1_EAN128/GS1_Databar
    ...  •	For the whole label:
    ...  o	Split the string in substrings less than 48 character long but do not split Application Identifiers
    ...  o	Use ]C1 as AIMID for those substrings
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                           Expected result
    EnterSP	                                $>
    Send  $CABEN01	                        $>
    Send  $CEBEN01	                        $>
    Send  $C8BEN01	                        $>
    Send  $C3BEN01	                        $>
    Send  $C4BEN01	                        $>
    Send  $CLBEN01	                        $>
    Send  $CXBEN01	                        $>
    Send  $C8CEM01	                        $>
    Send  $C3CEM01	                        $>
    Send  $CUCEM01	                        $>
    Send  $CECEM01	                        $>
    Send  $CACEM01	                        $>
    Send  $C4CEM01	                        $>
    Send  $CLCEM01	                        $>
    Send  $CXCEM01	                        $>
    Send  $Ar	                            $>
    Read  UPCA-COMP_CCA                 	]E00123456789012\\r]C1This is CCA
    Read  UPCA-COMP_CCB_48              	]E00123456789012\\r]C1This is CCB Long StringThis is CCB Long
    Read  UPCA-COMP-CCB_48              	]E00123456789012\\r]C1This is CCB Long StringThis is CCB Long StringTh\\r]C1is is CCB Long StringThis is CCB Long String
    Read  UPCE-COMP-CCA                 	]E00023456000073\\r]C1This is CCA
    Read  UPCE-COMP-CCB _Greater_48     	]E00023456000073\\r]C1This is CCB Long StringThis is CCB LongCCB123456
    Read  UPCE-COMP-CCB _Smaler_48      	]E00023456000073\\r]C1This is CCB Long StringThis is
    Read  EAN8-COMP-CCA                 	]E412345670\\r]C1This is CCA
    Read  EAN8-COMP-CCB _Greater_48     	]E412345670\\r]C1This is CCB Long StringThis is CCB Long StringTh\\r]C1is is CCB Long String
    Read  EAN8-COMP-CCB_Smaller_48      	]E412345670\\r]C1This is CCB Long StringThis is CCB
    Read  EAN13-COMP-CCA                	]E01234567890128\\r]C1This is CCA
    Read  EAN13-COMP-CCB_Greater_48     	]E01234567890128\\r]C1This is CCB Long StringThis is CCB Long StringTh\\r]C1is is CCB Long String
    Read  EAN13-COMP-CCB_Smaller_48     	]E01234567890128\\r]C1This is CCB Long StringThis is CCB
    Read  EAN128-COMP-CCA               	]C1ABCabcThis is CCA
    Read  EAN128-COMP-CCB_Greater_48        ]C1ABCabcThis is CCB Long StringThis is CCB Long St\\r]C1ringThisis CCB Long String
    Read  EAN128-COMP-CCB_Smaller_48    	]C1ABCabcThis is CCB Long StringThis is CCB
    Read  RSS14-COMP-CCA                	]C10100614141999996This is CCA
    Read  RSS14-COMP-CCB_Greater_48     	]C10100614141999996This is CCB Long StringThis is C\\r]C1CB Long StringThis is CCB Long String
    Read  RSS14-COMP-CCB_Smaller_48     	]C10100614141999996\\r]C1This is CCB Long StringThis is CCB
    Read  RSSEXP-COMP-CCA               	]C10100614141999996This is CCA
    Read  RSSEXP-COMP-CCB_Greate_48     	]C10100614141999996This is CCB Long StringThis is C\\r]C1CB Long StringThis is CCB Long String
    Read  RSSEXP-COMP-CCB_Smaler_48     	]C10100614141999996\\r]C1This is CCB Long StringThis is CCB
    Read  RSSLIM-COMP-CCA               	]C10100614141999996This is CCA
    Read  RSSLIM-COMP-CCB_Greater_48    	]C10100614141999996This is CCB Long StringThis is C\\r]C1CB Long StringThis is CCB Long String
    Read  RSSLIM-COMP-CCB_Smaller_48    	]C10100614141999996\\r]C1This is CCB Long StringThis is CCB
