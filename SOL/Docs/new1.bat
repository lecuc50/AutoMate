@echo OFF
pushd C:\Diamond\HHS\HHSProject\
@call robot --outputdir C:\Diamond\HHS\HHSProject\Output\ --timestampoutputs --variable COMPORT: --variable COMPORT:COM2 --variable interface_name:RS232_STD --variable reading_mode:CSNRM03 --variable soft_trigger:Off -i RS232_STD -e CordlessORGunWireless Procedures\Quick_Test\
@call robot --outputdir C:\Diamond\HHS\HHSProject\Output\ --timestampoutputs  --variable COMPORT:COM2 --variable interface_name:RS232_STD --variable reading_mode:CSNRM03 --variable soft_trigger:Off -i RS232_STD -e CordlessORGunWireless Procedures\Service_Port_Mode\
@call robot --outputdir C:\Diamond\HHS\HHSProject\Output\ --timestampoutputs --variable COMPORT: --variable COMPORT:COM2 --variable interface_name:RS232_STD --variable reading_mode:CSNRM00 --variable soft_trigger:On -i RS232_STD -e CordlessORGunWireless Procedures\Label_Programing\
EXIT 