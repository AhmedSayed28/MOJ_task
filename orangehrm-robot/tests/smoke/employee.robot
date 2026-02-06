*** Settings ***
Resource    ../../resources/Common.robot
Resource    ../../resources/Variables.robot
Resource    ../../pages/LoginPage.robot
Resource    ../../pages/PIMPage.robot

Suite Setup    Load Test Data
Test Setup       Open Application
Test Teardown    Close Application


*** Test Cases ***
Create Employee
    [Tags]    smoke
    Login As Admin
    Add Employee From Data
    Search Employee By Name From Data
    Verify Employee Appears In Results From Data
