@echo OFF
pushd C:\hhsautomation
@call robot --outputdir C:\hhsautomation\Logs\ULE --timestampoutputs --variable COMPORT:COM14 --variable interface_name:USB_COM --variable reading_mode:CSNRM03 -i USB_COM Tests\ULE\AT_UL_53369_ServiceModeScriptEntry.robot
EXIT