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

Smart Wait Keyword Example
    [Documentation]    Demonstrates direct usage of smart action keywords.
    Smart Input Text    name=username    Admin
    Smart Input Text    name=password    admin123
    Smart Click    css=button[type='submit']
    Smart Element Should Be Visible    xpath=//h6[normalize-space()='Dashboard']
