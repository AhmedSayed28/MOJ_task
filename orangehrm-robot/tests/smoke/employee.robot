*** Settings ***
Resource    ../../resources/Common.robot
Resource    ../../pages/LoginPage.robot

Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
Create Employee
    [Tags]    smoke
    Login As Admin    admin    admin123