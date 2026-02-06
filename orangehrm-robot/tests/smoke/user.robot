*** Settings ***
Resource    ../../resources/Common.robot
Resource    ../../resources/Variables.robot
Resource    ../../pages/LoginPage.robot
Resource    ../../pages/PIMPage.robot
Resource    ../../pages/AdminPage.robot

Suite Setup    Load Test Data
Test Setup       Open Application
Test Teardown    Close Application


*** Test Cases ***
Create System User And Login
    [Tags]    smoke
    Login As Admin
    Add Employee From Data
    Create System User From Data
    Logout
    Login As System User
    Verify Dashboard Visible
