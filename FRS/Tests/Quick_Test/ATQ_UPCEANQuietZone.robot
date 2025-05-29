*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}


*** Variables ***
${current_directory}         ${data_source}\\Quick_Test
*** test cases ***
ATQ_UPCEANQuietZone
    [Documentation]  Test cases is to check Quiet Zone of UPC-EAN that defined in Module (from 1 > 8), default Quiet Zone of UPC-Ean is 2 module
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS
    # Description                                   Expected result
    EnterSP			$>
    Send  $cUNLO			$>05
    Send  $CEBEN01			$>
    Send  $C8BEN01			$>
    Send  $C3BEN01			$>
    Send  $CUNLO02			$>
    Send  $Ar			$>
    Read  UPCA_Module2			123456789012
    Read  UPCA_Module3			123456789012
    Read  UPCA_Module4			123456789012
    Read  UPCA_Module5			123456789012
    Read  UPCA_Module6			123456789012
    Read  UPCA_Module7			123456789012
    Read  UPCA_Module8			123456789012
    Read  UPCE_Module2			02345673
    Read  UPCE_Module3			02345673
    Read  UPCE_Module4			02345673
    Read  UPCE_Module5			02345673
    Read  UPCE_Module6			02345673
    Read  UPCE_Module7			02345673
    Read  UPCE_Module8			02345673
    Read  EAN8_Module2			12345670
    Read  EAN8_Module3			12345670
    Read  EAN8_Module4			12345670
    Read  EAN8_Module5			12345670
    Read  EAN8_Module6			12345670
    Read  EAN8_Module7			12345670
    Read  EAN8_Module8			12345670
    Read  EAN13_Module2			1234567890128
    Read  EAN13_Module3			1234567890128
    Read  EAN13_Module4			1234567890128
    Read  EAN13_Module5			1234567890128
    Read  EAN13_Module6			1234567890128
    Read  EAN13_Module7			1234567890128
    Read  EAN13_Module8			1234567890128
    EnterSP			$>
    Send  $CUNLO01			$>
    Send  $CEBEN01			$>
    Send  $C8BEN01			$>
    Send  $C3BEN01			$>
    ExitSP			$>
    Read  UPCA_Module1			123456789012
    Read  UPCA_Module2			123456789012
    Read  UPCA_Module3			123456789012
    Read  UPCA_Module4			123456789012
    Read  UPCA_Module5			123456789012
    Read  UPCA_Module6			123456789012
    Read  UPCA_Module7			123456789012
    Read  UPCA_Module8			123456789012
    Read  UPCE_Module1			02345673
    Read  UPCE_Module2			02345673
    Read  UPCE_Module3			02345673
    Read  UPCE_Module4			02345673
    Read  UPCE_Module5			02345673
    Read  UPCE_Module6			02345673
    Read  UPCE_Module7			02345673
    Read  UPCE_Module8			02345673
    Read  EAN8_Module1			12345670
    Read  EAN8_Module2			12345670
    Read  EAN8_Module3			12345670
    Read  EAN8_Module4			12345670
    Read  EAN8_Module5			12345670
    Read  EAN8_Module6			12345670
    Read  EAN8_Module7			12345670
    Read  EAN8_Module8			12345670
    Read  EAN13_Module1			1234567890128
    Read  EAN13_Module2			1234567890128
    Read  EAN13_Module3			1234567890128
    Read  EAN13_Module4			1234567890128
    Read  EAN13_Module5			1234567890128
    Read  EAN13_Module6			1234567890128
    Read  EAN13_Module7			1234567890128
    Read  EAN13_Module8			1234567890128
    EnterSP			$>
    Send  $CUNLO03			$>
    ExitSP			$>
    Read  UPCA_Module3			123456789012
    Read  UPCA_Module4			123456789012
    Read  UPCA_Module5			123456789012
    Read  UPCA_Module6			123456789012
    Read  UPCA_Module7			123456789012
    Read  UPCA_Module8			123456789012
    Read  UPCE_Module3			02345673
    Read  UPCE_Module4			02345673
    Read  UPCE_Module5			02345673
    Read  UPCE_Module6			02345673
    Read  UPCE_Module7			02345673
    Read  UPCE_Module8			02345673
    Read  EAN8_Module3			12345670
    Read  EAN8_Module4			12345670
    Read  EAN8_Module5			12345670
    Read  EAN8_Module6			12345670
    Read  EAN8_Module7			12345670
    Read  EAN8_Module8			12345670
    Read  EAN13_Module3			1234567890128
    Read  EAN13_Module4			1234567890128
    Read  EAN13_Module5			1234567890128
    Read  EAN13_Module6			1234567890128
    Read  EAN13_Module7			1234567890128
    Read  EAN13_Module8			1234567890128
    EnterSP			$>
    Send  $CUNLO04			$>
    ExitSP			$>
    Read  UPCA_Module4			123456789012
    Read  UPCA_Module5			123456789012
    Read  UPCA_Module6			123456789012
    Read  UPCA_Module7			123456789012
    Read  UPCA_Module8			123456789012
    Read  UPCE_Module4			02345673
    Read  UPCE_Module5			02345673
    Read  UPCE_Module6			02345673
    Read  UPCE_Module7			02345673
    Read  UPCE_Module8			02345673
    Read  EAN8_Module4			12345670
    Read  EAN8_Module5			12345670
    Read  EAN8_Module6			12345670
    Read  EAN8_Module7			12345670
    Read  EAN8_Module8			12345670
    Read  EAN13_Module4			1234567890128
    Read  EAN13_Module5			1234567890128
    Read  EAN13_Module6			1234567890128
    Read  EAN13_Module7			1234567890128
    Read  EAN13_Module8			1234567890128
    EnterSP			$>
    Send  $CUNLO05			$>
    ExitSP			$>
    Read  UPCA_Module5			123456789012
    Read  UPCA_Module6			123456789012
    Read  UPCA_Module7			123456789012
    Read  UPCA_Module8			123456789012
    Read  UPCE_Module5			02345673
    Read  UPCE_Module6			02345673
    Read  UPCE_Module7			02345673
    Read  UPCE_Module8			02345673
    Read  EAN8_Module5			12345670
    Read  EAN8_Module6			12345670
    Read  EAN8_Module7			12345670
    Read  EAN8_Module8			12345670
    Read  EAN13_Module5			1234567890128
    Read  EAN13_Module6			1234567890128
    Read  EAN13_Module7			1234567890128
    Read  EAN13_Module8			1234567890128
    EnterSP			$>
    Send  $CUNLO06			$>
    ExitSP			$>
    Read  UPCA_Module6			123456789012
    Read  UPCA_Module7			123456789012
    Read  UPCA_Module8			123456789012
    Read  UPCE_Module6			02345673
    Read  UPCE_Module7			02345673
    Read  UPCE_Module8			02345673
    Read  EAN8_Module6			12345670
    Read  EAN8_Module7			12345670
    Read  EAN8_Module8			12345670
    Read  EAN13_Module6			1234567890128
    Read  EAN13_Module7			1234567890128
    Read  EAN13_Module8			1234567890128
    EnterSP			$>
    Send  $CUNLO07			$>
    ExitSP			$>
    Read  UPCA_Module7			123456789012
    Read  UPCA_Module8			123456789012
    Read  UPCE_Module7			02345673
    Read  UPCE_Module8			02345673
    Read  EAN8_Module7			12345670
    Read  EAN8_Module8			12345670
    Read  EAN13_Module7			1234567890128
    Read  EAN13_Module8			1234567890128
    EnterSP			$>
    Send  $CUNLO08			$>
    ExitSP			$>
    Read  UPCA_Module8			123456789012
    Read  UPCE_Module8			02345673
    Read  EAN8_Module8			12345670
    Read  EAN13_Module8			1234567890128
