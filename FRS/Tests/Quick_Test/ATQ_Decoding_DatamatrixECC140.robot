*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
*** Variables ***
${current_directory}         ${data_source}\\Quick_Test

*** test cases ***
ATQ_Decoding_DatamatrixECC140_LabelScaning
    [Documentation]  This test validates label scanning of DataMatrix ECC140 symbology. Tests validate minimum and maximum length requirements. Test validates label for Inverse
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                        Expected result
    EnterSP	                                                $>
    Send  $CDMEC01	                                        $>
    Send  $CIDCO01	                                        $>
    Send  $CDMEN01	                                        $>
    Send  $Ar	                                            $>
    Read  DataMatrixECC140_123456789	                    Dm123456789
    Read  DataMatrixECC140_INVERSE_123456789                ${EMPTY}
ATQ_Decoding_DatamatrixECC140_EnableInverse
    [Documentation]  Enable Inverse. Verify that the HH can decode Inverse
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                        Expected result
    EnterSP	                                                $>
    Send  $CDMEC01	                                        $>
    Send  $CIDCO01	                                        $>
    Send  $CDMEN01	                                        $>
    Send  $CIPLR02	                                        $>
    Send  $CIPNR02	                                        $>
    Send  $CDMEN01	                                        $>
    Send  $Ar	                                            $>
    Read  DataMatrixECC140_123456789                    	Dm123456789
    Read  DataMatrixECC140_INVERSE_123456789            	Dm123456789
ATQ_Decoding_DatamatrixECC140_DisableInverse
    [Documentation]  Disable Inverse. Verify that the HH can't decode Inverse
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                        Expected result
    EnterSP	                                                $>
    Send  $CDMEC01	                                        $>
    Send  $CIDCO01	                                        $>
    Send  $CDMEN01	                                        $>
    Send  $CIPLR02	                                        $>
    Send  $CIPNR00	                                        $>
    Send  $CDMEN01	                                        $>
    Send  $Ar	                                            $>
    Read  DataMatrixECC140_123456789                    	Dm123456789
    Read  DataMatrixECC140_INVERSE_123456789                ${EMPTY}
ATQ_Decoding_DatamatrixECC140_Fixed Length with length1
    [Documentation]  This test validates label scanning for DataMatrix ECC140 when variable length is enabled. The length is 1 character.
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                        Expected result
    EnterSP	                                                $>
    Send  $CDMEC01	                                        $>
    Send  $CDMEN01	                                        $>
    Send  $CIDCO01	                                        $>
    Send  $CDMLC01	                                        $>
    Send  $CDML10001	                                    $>
    Send  $Ar	                                            $>
    Read  DataMatrixECC140_A	                            DmA
    Read  DataMatrixECC140_ABC                              ${EMPTY}
ATQ_Decoding_DatamatrixECC140_Fix Length with length1 and length2
    [Documentation]  This test validates label scanning for DataMatrix ECC140 when variable length is enabled. The length is 3 characters.
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                        Expected result
    EnterSP	                                                $>
    Send  $CDMEC01	                                        $>
    Send  $CIDCO01	                                        $>
    Send  $CDMEN01	                                        $>
    Send  $CDMLC01	                                        $>
    Send  $CDML10001	                                    $>
    Send  $CDML20003	                                    $>
    Send  $Ar	                                            $>
    Read  DataMatrixECC140_A	                            DmA
    Read  DataMatrixECC140_ABC	                            DmABC
    Read  DataMatrixECC140_AB                               ${EMPTY}
ATQ_Decoding_DatamatrixECC140_Variable Length
    [Documentation]  This test validates label scanning for DataMatrix  ECC140 when variable length is enabled. The length minimum is 8 characters and maximum is 32 characters.
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                        Expected result
    EnterSP	                                                $>
    Send  $CDMEC01	                                        $>
    Send  $CIDCO01	                                        $>
    Send  $CDMEN01	                                        $>
    Send  $CDMLC00	                                        $>
    Send  $CDML10008	                                    $>
    Send  $CDML20020	                                    $>
    Send  $Ar	                                            $>
    Read  DataMatrixECC140_12345678	                        Dm12345678
    Read  DataMatrixECC140_1234567891011	                Dm1234567891011
    Read  DataMatrixECC140_12345678910111213141516171819201	        Dm12345678910111213141516171819201
    Read  DataMatrixECC140_123456                                   ${EMPTY}
    Read  DataMatrixECC140_123456789101112131415161718192012        ${EMPTY}
ATQ_Decoding_DatamatrixECC140_Disable DataMatrix
    [Documentation]  Disable Datamatrix, the HH can't read Datamatrix ECC140
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                        Expected result
    EnterSP	                                                $>
    Send  $CDMEC01	                                        $>
    Send  $CDMEN00	                                        $>
    Send  $Ar	                                            $>
    Read  DataMatrixECC140_12345678                         ${EMPTY}
ATQ_Decoding_DatamatrixECC140_LabelFormatting_Prefix
    [Documentation]  This is a control test. This test validates software properly manage the label formatting for DataMatrix ECC 140 when AIM ID is enabled. The label ID is placed before the label data.
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                        Expected result
    EnterSP	                                                $>
    Send  $CDMEC01	                                        $>
    Send  $CDMEN01	                                        $>
    Send  $CIDCO01	                                        $>
    Send  $CDMAI01	                                        $>
    Send  $CDMID754100	                                    $>
    Send  $CLFPR4131000000000000000000000000000000000000	$>
    Send  $CLFSU42620D0000000000000000000000000000000000	$>
    Send  $Ar	                                            $>
    Read  DataMatrixECC140_123456789    	                A1uA]d0123456789Bb
ATQ_Decoding_DatamatrixECC140_LabelFormatting_Suffix
    [Documentation]  This is a control test. This test validates software properly manage the label formatting for DataMatrix  ECC140 when AIM ID is disabled. The label ID is placed after the label data.
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                        Expected result
    EnterSP	                                                $>
    Send  $CDMEC01	                                        $>
    Send  $CDMEN01	                                        $>
    Send  $CDMAI01	                                        $>
    Send  $CDMID754100	                                    $>
    Send  $CLFPR4131000000000000000000000000000000000000	$>
    Send  $CLFSU42620D0000000000000000000000000000000000	$>
    Send  $CIDCO02	                                        $>
    Send  $Ar	                                            $>
    Read  DataMatrixECC140_123456789    	                A1]d0123456789uABb
ATQ_Decoding_DatamatrixECC140_LabelFormatting_CaseConversion_LowCase
    [Documentation]  This is a control test. This test validates software convert case when lower case conversion is enabled.
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                        Expected result
    EnterSP	                                                $>
    Send  $CDMEC01	                                        $>
    Send  $CDMEN01	                                        $>
    Send  $CDMAI01	                                        $>
    Send  $CDMID754100	                                    $>
    Send  $CLFPR4131000000000000000000000000000000000000	$>
    Send  $CLFSU42620D0000000000000000000000000000000000	$>
    Send  $CIDCO02	                                        $>
    Send  $CLFCA02	                                        $>
    Send  $Ar	                                            $>
    Read  DataMatrixECC140_ABCDEFGHK	                    A1]d0abcdefghkuABb
ATQ_Decoding_DatamatrixECC140_LabelFormatting_CaseConversion_UpCase
    [Documentation]  This is a control test. This test validates software convert case when Up case conversion is enabled.
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                        Expected result
    EnterSP	                                                $>
    Send  $CDMEC01	                                        $>
    Send  $CDMEN01	                                        $>
    Send  $CDMAI01	                                        $>
    Send  $CDMID754100	                                    $>
    Send  $CLFPR4131000000000000000000000000000000000000	$>
    Send  $CLFSU42620D0000000000000000000000000000000000	$>
    Send  $CIDCO02	                                        $>
    Send  $CLFCA01	                                        $>
    Send  $Ar	                                            $>
    Read  DataMatrixECC140_1_abcdefghk	                    A1]d0ABCDEFGHKuABb
ATQ_Decoding_DatamatrixECC140_LabelFormatting_CharacterConversion
    [Documentation]  This is a control test. This test validates software does not convert character when character conversion is enabled.
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                        Expected result
    EnterSP	                                                $>
    Send  $CDMEC01	                                        $>
    Send  $CDMEN01	                                        $>
    Send  $CDMAI01	                                        $>
    Send  $CDMID754100	                                    $>
    Send  $CLFPR4131000000000000000000000000000000000000	$>
    Send  $CLFSU42620D0000000000000000000000000000000000	$>
    Send  $CIDCO02	                                        $>
    Send  $CLFCA01	                                        $>
    Send  $CLFCH3141324233433444	                        $>
    Send  $Ar	                                            $>
    Read  DataMatrixECC140_123456789                    	A1]d0ABCD56789uABb
ATQ_Decoding_DatamatrixECC140_LabelFormatting_NoCaseConversion
    [Documentation]  This test validates that enabling user label edit has no effect on standard label formatting as long as label edit script is not loaded in the scanner.
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                        Expected result
    EnterSP	                                                $>
    Send  $CDMEC01	                                        $>
    Send  $CDMEN01	                                        $>
    Send  $CDMAI01	                                        $>
    Send  $CDMID754100	                                    $>
    Send  $CLFPR4131000000000000000000000000000000000000	$>
    Send  $CLFSU42620D0000000000000000000000000000000000	$>
    Send  $CIDCO02	                                        $>
    Send  $CLFCA01	                                        $>
    Send  $CLFCA00	                                        $>
    Send  $CLFCHFFFFFFFFFFFFFFFF	                        $>
    Send  $CLEEN01	                                        $>
    Send  $Ar	                                            $>
    Read  DataMatrixECC140_123456789                    	A1]d0123456789uABb
