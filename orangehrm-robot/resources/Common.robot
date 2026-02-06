*** Settings ***
Library    SeleniumLibrary  screenshot_root_directory=results/screens
Library    TestData.py
Library    String
Resource   Variables.robot
Resource   BaseActions.robot

*** Keywords ***
Load Test Data
    Load Test Data File    ${TEST_DATA_FILE}

Get Test Data Value
    [Arguments]    ${section}    ${key}
    ${section_data}=    Get From Dictionary    ${TEST_DATA}    ${section}
    ${value}=    Get From Dictionary    ${section_data}    ${key}
    RETURN    ${value}

Get Employee Full Name From Data
    ${first_name}=    Get Test Data Value    employee    firstName
    ${last_name}=     Get Test Data Value    employee    lastName
    ${full_name}=    Catenate    SEPARATOR=    ${first_name}    ${SPACE}    ${last_name}
    RETURN    ${full_name}

Get Candidate Full Name From Data
    ${first_name}=    Get Test Data Value    candidate    firstName
    ${last_name}=     Get Test Data Value    candidate    lastName
    ${full_name}=    Catenate    SEPARATOR=    ${first_name}    ${SPACE}    ${last_name}
    RETURN    ${full_name}

Open Application
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Register Keyword To Run On Failure    Capture Page Screenshot

Close Application
    Run Keyword If Test Failed    Capture Page Screenshot
    Close Browser
