*** Settings ***
Library    SeleniumLibrary  screenshot_root_directory=results/screens
Library    DateTime
Library    String
Resource   Variables.robot
Resource   BaseActions.robot

*** Keywords ***
Open Application
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Register Keyword To Run On Failure    Capture Page Screenshot

Close Application
    Run Keyword If Test Failed    Capture Page Screenshot
    Close Browser

Generate Unique Id
    ${timestamp}=    Get Time    result_format=%Y%m%d%H%M%S
    RETURN    ${timestamp}

Generate Unique Name
    [Arguments]    ${prefix}
    ${unique}=    Generate Unique Id
    ${name}=    Catenate    SEPARATOR=    ${prefix}    ${unique}
    RETURN    ${name}

Generate Unique Email
    [Arguments]    ${prefix}
    ${unique}=    Generate Unique Id
    ${email}=    Catenate    SEPARATOR=    ${prefix}    ${unique}    @example.com
    RETURN    ${email}
