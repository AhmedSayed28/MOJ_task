*** Settings ***
Resource    ../../resources/Common.robot
Resource    ../../pages/LoginPage.robot
Resource    ../../pages/PIMPage.robot

Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
Create Employee
    [Tags]    smoke
    Login As Admin    admin    admin123
    Create New Employee
    Verify Employee Created
