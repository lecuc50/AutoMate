@echo OFF
pushd C:\Cong Viec\Demo\hhsautomation
@call robot --outputdir C:\Diamond\HHS\Ruby_Test\Output\ --timestampoutputs --variable COMPORT:COM2 --variable interface_name:RS232_STD --variable reading_mode:CSNRM00 --variable soft_trigger:On -i RS232_STD -e CordlessORGunWireless Procedures\Service_Port_Mode\AT_SP_MasterDefault_Bologna.robot
EXIT