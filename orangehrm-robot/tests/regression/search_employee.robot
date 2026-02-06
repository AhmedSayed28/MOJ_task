*** Settings ***
Resource    ../../resources/Common.robot
Resource    ../../resources/Variables.robot
Resource    ../../pages/LoginPage.robot
Resource    ../../pages/PIMPage.robot

Suite Setup    Prepare Employee For Search
Suite Teardown    Close Application

*** Keywords ***
Prepare Employee For Search
    Open Application
    Login As User    ${ADMIN_USER}    ${ADMIN_PASS}
    ${first_name}=    Generate Unique Name    SearchFirst
    ${last_name}=     Generate Unique Name    SearchLast
    ${employee_id}=    Add Employee    ${first_name}    ${last_name}
    ${full_name}=    Catenate    SEPARATOR=    ${first_name}    ${SPACE}    ${last_name}
    Set Suite Variable    ${SEARCH_EMPLOYEE_NAME}    ${full_name}

*** Test Cases ***
Search Employee
    [Tags]    regression
    Search Employee By Name    ${SEARCH_EMPLOYEE_NAME}
    Verify Employee Appears In Results    ${SEARCH_EMPLOYEE_NAME}
