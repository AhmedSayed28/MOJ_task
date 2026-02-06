*** Settings ***
Library    SeleniumLibrary

*** Keywords ***

Login As Admin
    [Arguments]    ${user}    ${pass}
    Input Text    name=username    ${user}
    Input Text    name=password    ${pass}
    Click Button  css=button[type='submit']
    Wait Until Page Contains    Dashboard
