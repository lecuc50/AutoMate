@echo OFF
pushd C:\hhsautomation
@call robot --outputdir C:\hhsautomation\Logs\ULE --variable COMPORT:COM14 --variable interface_name:USB_COM --variable reading_mode:CSNRM03 -i USB_COM Tests\ULE\AT_UL_53368_ScriptStorage.robot
ECHO AT_UL_53368_ScriptStorage_log.html =C:\\hhsautomation\\Logs\\ULE\\log.html >> %qm_AttachmentsFile%
ECHO AT_UL_53368_ScriptStorage_report.html =C:\\hhsautomation\\Logs\\ULE\\report.html >> %qm_AttachmentsFile%
ECHO AT_UL_53368_ScriptStorage_output.xml =C:\\hhsautomation\\Logs\\ULE\\report.xml >> %qm_AttachmentsFile%
EXIT
