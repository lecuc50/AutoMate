*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}


*** Variables ***
${current_directory}         ${data_source}\\Quick_Test
*** test cases ***
ATQ_GS1DigitalLink_TransmitMode
    [Documentation]  TThis test case verify set transmit mode for GS1 label set.
	...  Configuation: CI_GS1_LABEL_TRANSMIT_MODES: GDTM	00=Disable
    ...  01=Send only the first GS1 label
    ...  02=Send all GS1 label
    ...  03=Prefer 2D GS1 label
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                               Expected result
    Send  $S,cGDTM,s	                            $>,>00,>
    Read  Campbells Tomato Soup                 	051000006011 OR/ https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Send  $S,CGDTM01,Ar	                            $>,>,>
    Read  Campbells Tomato Soup                 	051000006011 OR/ https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Send  $S,CGDTM02,Ar	                            $>,>,>
    Read  Campbells Tomato Soup                 	$n00000002051000006011\n$n00000002https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Send  $S,CGDTM03,CGDBSFF,Ar	                    $>,>,>,>
    Read  Campbells Tomato Soup                 	051000006011 OR/ https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Send  $S,CGDTM00,s	                            $>,>,>
    Read  Campbells Tomato Soup                 	051000006011 OR/ https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
