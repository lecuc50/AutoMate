*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
*** Variables ***
${current_directory}         ${data_source}\\Quick_Test

*** test cases ***
ATQ_GS1DigitalLink_DoubleReadTimeout
    [Documentation]  This test case verify use GS1 Digital Double Read Timeout to prevent sending any additional labels of set after transmission of label set result.
    ...  Covers case when not all labels from a set are seen during GS1_DIGITAL_LINK_SET_TIMEOUT and then an additional label is seen after first result is transmitted.
    ...  Configuration: CI_GS1_DIGITAL_LINK_SET_DOUBLE_READ_TIMEOUT
    ...  GDDR: min = 01, max = 0xFF (inscreate by  = 10ms). Default = 0x46 (700ms)
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                               Expected result
    Send  $S,CGDTM01,Ar			                                $>,>,>
    Read  Label Set 1-UPCA_Campbells Tomato Soup_Datamatrix		051000006011 OR/ https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Read  Label Set 1-UPCA_Campbells Tomato Soup_QRCode			051000006011 OR/ https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Send  $S,CGDTM02,Ar			                                $>,>,>
    Read  Label Set 1-UPCA_Campbells Tomato Soup_Datamatrix		$n00000002051000006011\n$n00000002https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Read  Label Set 1-UPCA_Campbells Tomato Soup_QRCode			$n00000002051000006011\n$n00000002https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Send  $S,CGDTM03,Ar			                                $>,>,>
    Read  Label Set 1-UPCA_Campbells Tomato Soup_Datamatrix		051000006011 OR/ https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Read  Label Set 1-UPCA_Campbells Tomato Soup_QRCode			051000006011 OR/ https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Send  $S,CGDDR46,Ar			                                $>,>,>
    Send  $S,CGDTM01,Ar			                                $>,>,>
    Read  Label Set 1-UPCA_Campbells Tomato Soup_Datamatrix		051000006011 OR/ https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Read  Label Set 1-UPCA_Campbells Tomato Soup_QRCode			051000006011 OR/ https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Send  $S,CGDTM02,Ar			                                $>,>,>
    Read  Label Set 1-UPCA_Campbells Tomato Soup_Datamatrix		$n00000002051000006011\n$n00000002https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Read  Label Set 1-UPCA_Campbells Tomato Soup_QRCode			$n00000002051000006011\n$n00000002https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Send  $S,CGDTM03,Ar			                                $>,>,>
    Read  Label Set 1-UPCA_Campbells Tomato Soup_Datamatrix		051000006011 OR/ https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Read  Label Set 1-UPCA_Campbells Tomato Soup_QRCode			051000006011 OR/ https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Send  $S,CGDDR01,Ar			                                $>,>,>
    Send  $S,CGDTM01,Ar			                                $>,>,>
    Read  Label Set 1-UPCA_Campbells Tomato Soup_Datamatrix		051000006011 OR/ https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Read  Label Set 1-UPCA_Campbells Tomato Soup_QRCode			051000006011 OR/ https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Send  $S,CGDTM02,Ar			                                $>,>,>
    Read  Label Set 1-UPCA_Campbells Tomato Soup_Datamatrix		$n00000002051000006011\n$n00000002https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Read  Label Set 1-UPCA_Campbells Tomato Soup_QRCode			$n00000002051000006011\n$n00000002https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Send  $S,CGDTM03,Ar			                                $>,>,>
    Read  Label Set 1-UPCA_Campbells Tomato Soup_Datamatrix		051000006011 OR/ https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Read  Label Set 1-UPCA_Campbells Tomato Soup_QRCode			051000006011 OR/ https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Send  $S,CGDDR26,Ar			                                $>,>,>
    Send  $S,CGDTM01,Ar			                                $>,>,>
    Read  Label Set 1-UPCA_Campbells Tomato Soup_Datamatrix		051000006011 OR/ https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Read  Label Set 1-UPCA_Campbells Tomato Soup_QRCode			051000006011 OR/ https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Send  $S,CGDTM02,Ar			                                $>,>,>
    Read  Label Set 1-UPCA_Campbells Tomato Soup_Datamatrix		$n00000002051000006011\n$n00000002https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Read  Label Set 1-UPCA_Campbells Tomato Soup_QRCode			$n00000002051000006011\n$n00000002https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Send  $S,CGDTM03,Ar			                                $>,>,>
    Read  Label Set 1-UPCA_Campbells Tomato Soup_Datamatrix		051000006011 OR/ https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Read  Label Set 1-UPCA_Campbells Tomato Soup_QRCode			051000006011 OR/ https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Send  $S,CGDDR66,Ar			                                $>,>,>
    Send  $S,CGDTM01,Ar			                                $>,>,>
    Read  Label Set 1-UPCA_Campbells Tomato Soup_Datamatrix		051000006011 OR/ https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Read  Label Set 1-UPCA_Campbells Tomato Soup_QRCode			051000006011 OR/ https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Send  $S,CGDTM02,Ar			                                $>,>,>
    Read  Label Set 1-UPCA_Campbells Tomato Soup_Datamatrix		$n00000002051000006011\n$n00000002https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Read  Label Set 1-UPCA_Campbells Tomato Soup_QRCode			$n00000002051000006011\n$n00000002https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Send  $S,CGDTM03,Ar			                                $>,>,>
    Read  Label Set 1-UPCA_Campbells Tomato Soup_Datamatrix		051000006011 OR/ https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Read  Label Set 1-UPCA_Campbells Tomato Soup_QRCode			051000006011 OR/ https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Send  $S,CGDDRFF,Ar			                                $>,>,>
    Send  $S,CGDTM01,Ar			                                $>,>,>
    Read  Label Set 1-UPCA_Campbells Tomato Soup_Datamatrix		051000006011 OR/ https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Read  Label Set 1-UPCA_Campbells Tomato Soup_QRCode			051000006011 OR/ https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Send  $S,CGDTM02,Ar			                                $>,>,>
    Read  Label Set 1-UPCA_Campbells Tomato Soup_Datamatrix		$n00000002051000006011\n$n00000002https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Read  Label Set 1-UPCA_Campbells Tomato Soup_QRCode			$n00000002051000006011\n$n00000002https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Send  $S,CGDTM03,Ar			                                $>,>,>
    Read  Label Set 1-UPCA_Campbells Tomato Soup_Datamatrix		051000006011 OR/ https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Read  Label Set 1-UPCA_Campbells Tomato Soup_QRCode			051000006011 OR/ https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229

