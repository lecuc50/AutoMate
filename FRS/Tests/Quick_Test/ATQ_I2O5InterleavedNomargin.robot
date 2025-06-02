*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}


*** Variables ***
${current_directory}         ${data_source}\\Quick_Test
*** test cases ***
ATQ_I2O5InterleavedNomargin_Senario1
    [Documentation]  When testing the no margin options, the library works in this way:
    ...  -	With normal barcode: Both sides of barcode pass the normal margin verification, so scanner can decode normally
    ...  -	With barcode has short or very short (<= 1 modul ) quiet zone at first side: the localizer starts at the side had wider quiet zone so it starts at last side of barcode
    ...  -	With barcode has short or very short (<= 1 modul ) quiet zone at last side: the localizer starts at the side had wider quiet zone so it starts at first side of barcode
    ...  -	With barcode has short or very short (<= 1 modul ) quiet zone at both sides: Both sides of barcode do not pass the normal margin verification, so the no margin control should be enabled for decoding it
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                               Expected result
    Send  $S,CI2EN01,CI2SM00,CI2FM00,CI2LM00,Ar	                $>,>,>,>,>,>
    Read  I2of5 normal margins (1°)                         	9978452900
ATQ_I2O5InterleavedNomargin_Senario2
    [Documentation]  Only Short Margins is Enable
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                               Expected result
    Send  $S,CI2EN01,CI2SM01,CI2FM00,CI2LM00,Ar	                $>,>,>,>,>,>
    Read  I2of5 normal margins (1°)                         	9978452900
    Read  I2of5 First Short margins (2a)                    	9978452900
    Read  I2of5 Both Short margins (2b)                     	9978452900
    Read  I2of5 Last Short margins (2c)                      	9978452900
ATQ_I2O5InterleavedNomargin_Senario3
    [Documentation]  Only No Last Margin is Enabled
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                               Expected result
    Send  $S,CI2EN01,CI2SM00,CI2FM00,CI2LM01,Ar	                $>,>,>,>,>,>
    Read  I2of5 normal margins (1°)                         	9978452900
    Read  I2of5 First Short margins (2a)                    	9978452900
    Read  I2of5 Last Short margins (2c)                     	9978452900
    Read  I2of5 No last margin (3a)                         	9978452900
    Read  I2of5 No first margin (3b)                        	9978452900
ATQ_I2O5InterleavedNomargin_Senario4
    [Documentation]  Both No First and Last Margin are Enabled
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                               Expected result
    Send  $S,CI2EN01,CI2SM00,CI2FM01,CI2LM01,Ar	                $>,>,>,>,>,>
    Read  I2of5 normal margins (1°)                         	9978452900
    Read  I2of5 First Short margins (2a)                    	9978452900
    Read  I2of5 Both Short margins (2b)                     	9978452900
    Read  I2of5 Last Short margins (2c)                     	9978452900
    Read  I2of5 No last margin (3a)                         	9978452900
    Read  I2of5 No first margin (3b)                        	9978452900
    Read  I2of5 No first no short margins (3c)              	9978452900
ATQ_I2O5InterleavedNomargin_Senario5
    [Documentation]  All Margin control Cis are Enabled
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                               Expected result
    Send  $S,CI2EN01,CI2SM01,CI2FM01,CI2LM01,Ar	                $>,>,>,>,>,>
    Read  I2of5 normal margins (1°)                         	9978452900
    Read  I2of5 First Short margins (2a)                    	9978452900
    Read  I2of5 Both Short margins (2b)                     	9978452900
    Read  I2of5 Last Short margins (2c)                     	9978452900
    Read  I2of5 No last margin (3a)                         	9978452900
    Read  I2of5 No first margin (3b)                        	9978452900
    Read  I2of5 No first no short margins (3c)              	9978452900
