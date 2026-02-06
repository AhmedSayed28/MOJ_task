*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SMART_RETRY_COUNT}       3
${SMART_RETRY_INTERVAL}    500ms
${SMART_WAIT_TIMEOUT}      10s

*** Keywords ***
Smart Wait For Element
    [Arguments]    ${locator}    ${timeout}=${SMART_WAIT_TIMEOUT}
    Wait Until Page Contains Element    ${locator}    timeout=${timeout}
    Wait Until Element Is Visible       ${locator}    timeout=${timeout}
    Wait Until Element Is Enabled       ${locator}    timeout=${timeout}

Smart Click
    [Arguments]    ${locator}    ${timeout}=${SMART_WAIT_TIMEOUT}
    Wait Until Keyword Succeeds    ${SMART_RETRY_COUNT}    ${SMART_RETRY_INTERVAL}    Smart Click Once    ${locator}    ${timeout}

Smart Click Once
    [Arguments]    ${locator}    ${timeout}
    Smart Wait For Element    ${locator}    ${timeout}
    Click Element    ${locator}

Smart Input Text
    [Arguments]    ${locator}    ${text}    ${timeout}=${SMART_WAIT_TIMEOUT}    ${clear}=${TRUE}
    Wait Until Keyword Succeeds    ${SMART_RETRY_COUNT}    ${SMART_RETRY_INTERVAL}    Smart Input Text Once    ${locator}    ${text}    ${timeout}    ${clear}

Smart Input Text Once
    [Arguments]    ${locator}    ${text}    ${timeout}    ${clear}
    Smart Wait For Element    ${locator}    ${timeout}
    Run Keyword If    ${clear}    Clear Element Text    ${locator}
    Input Text    ${locator}    ${text}

Smart Get Text
    [Arguments]    ${locator}    ${timeout}=${SMART_WAIT_TIMEOUT}
    ${value}=    Wait Until Keyword Succeeds    ${SMART_RETRY_COUNT}    ${SMART_RETRY_INTERVAL}    Smart Get Text Once    ${locator}    ${timeout}
    RETURN    ${value}

Smart Get Text Once
    [Arguments]    ${locator}    ${timeout}
    Smart Wait For Element    ${locator}    ${timeout}
    ${value}=    Get Text    ${locator}
    RETURN    ${value}

Smart Element Should Be Visible
    [Arguments]    ${locator}    ${timeout}=${SMART_WAIT_TIMEOUT}
    Wait Until Keyword Succeeds    ${SMART_RETRY_COUNT}    ${SMART_RETRY_INTERVAL}    Smart Element Should Be Visible Once    ${locator}    ${timeout}

Smart Element Should Be Visible Once
    [Arguments]    ${locator}    ${timeout}
    Smart Wait For Element    ${locator}    ${timeout}
    Element Should Be Visible    ${locator}
