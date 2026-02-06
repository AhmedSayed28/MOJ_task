*** Settings ***
Resource    ../../resources/Common.robot
Resource    ../../resources/Variables.robot
Resource    ../../pages/LoginPage.robot
Resource    ../../pages/PIMPage.robot
Resource    ../../pages/AdminPage.robot

Test Setup       Open Application
Test Teardown    Close Application

*** Test Cases ***
Create System User And Login
    [Tags]    smoke
    Login As User    ${ADMIN_USER}    ${ADMIN_PASS}
    ${first_name}=    Generate Unique Name    UserFirst
    ${last_name}=     Generate Unique Name    UserLast
    ${employee_id}=    Add Employee    ${first_name}    ${last_name}
    ${employee_name}=    Catenate    SEPARATOR=    ${first_name}    ${SPACE}    ${last_name}
    ${unique}=    Generate Unique Id
    ${username}=    Catenate    SEPARATOR=    user_    ${unique}
    ${password}=    Catenate    SEPARATOR=    Pass!    ${unique}    Aa
    Create System User    ${employee_name}    ${username}    ${password}
    Logout
    Login As User    ${username}    ${password}
    Verify Dashboard Visible
