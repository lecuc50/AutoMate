*** Settings ***
Documentation     This is a resource file, that can contain variables and keywords.
...               Keywords defined here can be used where this Keywords.resource in loaded.
Library  ../Resources/HHSKeywords.py
Library  ../Resources/Compare.py
Library    String
Resource    Variables.resource



*** Keywords ***
# Below are all keyword for Serial Com Port
Open Connection
    [Arguments]      ${INTERFACE_NAME}    ${COMPORT}
    ${data}=  Init Connection    hhs  ${INTERFACE_NAME}    ${COMPORT}
    Log    ${data}      console=true

Close Connection
    ${data}=  Close
    Log  "Close Connection: " ${data}  console=true

EnterSP
    [Arguments]     ${value}=${None}
    Log     \nSending Command: $S  console=True
    ${data} =   Enter Service Port
    Log     Expected--------: ${value}        console=True
    Log     Responded-------: ${data}         console=True
    IF    $value!=None
        Run Keyword And Continue On Failure     Should Be Equal    ${data}    ${value}\r
    END
    RETURN   ${data}

ExitSP
    [Arguments]     ${value}=${None}
    Log    \nSending Command: $s            console=True
    ${data}=     Exit Service Port
    Log    Expected-------: ${value}        console=True
    Log    Responded------: ${data}         console=True
    IF    $value!=None
        Run Keyword And Continue On Failure     Should Be Equal    ${data}    ${value}
    END
    RETURN   ${data}

Send
    [Arguments]     ${command}  ${value}=${None}
    Log    \nSending Command: ${command}        console=True
    ${data}=    Send Command    ${command}
    Log    Expected-------: ${value}            console=True
    Log    Responded------: ${data}             console=True
    IF    $value!=None
        ${data}=   Run Keyword And Continue On Failure     Compare.Compare Data    \nSending Command: ${command}  ${data}    ${value}
        Run Keyword And Continue On Failure   Should Be Equal    ${data}    True
    END
    RETURN   ${data}

Read
    [Arguments]      ${image_name}  ${value}=${None}
    Log  \nReading label: ${image_name}  console=True
    ${data}=     Run Keyword And Continue On Failure    Read Label    ${current_directory}     ${image_name}
    Log  Expected-----: ${value}  console=True
    Log  Responded----: ${data}  console=True
    LogImage   ${image_name}
    IF    $value!=None
        ${data}=   Run Keyword And Continue On Failure     Compare.Compare Data    \nReading label: ${image_name}  ${data}    ${value}
        Run Keyword And Continue On Failure   Should Be Equal    ${data}    True
    END
    RETURN   ${data}
    

LogImage
    [Arguments]      ${image_name}
    ${data}=   Set Variable   ${current_directory}\\${image_name}.jpg
    Log            <img src=${data}>        html=true

Reading Mode
    [Arguments]      ${READING_MODE}
    ${data}=  Set Reading Mode    ${READING_MODE}

Get Device Version
    ${data}=  Get FirmWare Version
    Log  "Device Version: " ${data}  console=true

Get TestMate Version
    ${data}=  Get Testmate Release
    Log  "Testmate version: " ${data}  console=true
