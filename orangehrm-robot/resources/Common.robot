*** Settings ***
Library    SeleniumLibrary  screenshot_root_directory=results/screens
Library    TestData.py
Library    String
Resource   Variables.robot
Resource   BaseActions.robot

*** Variables ***
${CREATED_USERNAME}    ${EMPTY}
${TEST_DATA}           ${EMPTY}

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

Set Created Username
    [Arguments]    ${username}
    [Documentation]    Store the generated username as a Suite Variable for reuse in login tests
    Set Suite Variable    ${CREATED_USERNAME}    ${username}

Get Created Username
    [Documentation]    Retrieve the stored username from Suite Variable. Returns the stored username if available, empty string otherwise.
    ${username}=    Get Variable Value    ${CREATED_USERNAME}    ${EMPTY}
    RETURN    ${username}

Open Application
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Register Keyword To Run On Failure    Capture Page Screenshot

Close Application
    Run Keyword If Test Failed    Capture Page Screenshot
    Close Browser

