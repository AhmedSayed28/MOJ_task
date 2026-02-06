*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/BaseActions.robot

*** Keywords ***
Login As Admin
    [Arguments]    ${user}    ${pass}
    Smart Input Text    name=username    ${user}
    Smart Input Text    name=password    ${pass}
    Smart Click    css=button[type='submit']
    Wait Until Page Contains    Dashboard
