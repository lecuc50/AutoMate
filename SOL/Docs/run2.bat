@echo OFF
pushd C:\Diamond\HHS\Ruby_Test\
@call robot --outputdir C:\Diamond\HHS\Ruby_Test\Output\HHS --timestampoutputs --variable COMPORT:COM2 --variable interface_name:RS232_STD --variable reading_mode:CSNRM00 --variable soft_trigger:ON -i USB_COM -e CordlessORGunWireless Tests\Quick_Test

EXIT