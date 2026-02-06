*** Settings ***
Resource    ../../resources/Common.robot
Resource    ../../resources/Variables.robot
Resource    ../../pages/LoginPage.robot
Resource    ../../pages/PIMPage.robot

Suite Setup    Prepare Employee For Search
Suite Teardown    Close Application

*** Keywords ***
Prepare Employee For Search
    Load Test Data
    Open Application
    Login As Admin
    Add Employee From Data

*** Test Cases ***
Search Employee
    [Tags]    regression
    Search Employee By Name From Data
    Verify Employee Appears In Results From Data
