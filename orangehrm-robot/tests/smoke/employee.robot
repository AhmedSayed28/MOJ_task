*** Settings ***
Resource    ../../resources/Common.robot
Resource    ../../resources/Variables.robot
Resource    ../../pages/LoginPage.robot
Resource    ../../pages/PIMPage.robot

Test Setup       Open Application
Test Teardown    Close Application

*** Test Cases ***
Create Employee
    [Tags]    smoke
    ${first_name}=    Generate Unique Name    AutoFirst
    ${last_name}=     Generate Unique Name    AutoLast
    Login As User    ${ADMIN_USER}    ${ADMIN_PASS}
    ${employee_id}=    Add Employee    ${first_name}    ${last_name}
    ${full_name}=    Catenate    SEPARATOR=    ${first_name}    ${SPACE}    ${last_name}
    Search Employee By Name    ${full_name}
    Verify Employee Appears In Results    ${full_name}
