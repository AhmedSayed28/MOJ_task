*** Settings ***
Library    SeleniumLibrary  screenshot_root_directory=results/screens
Resource   Variables.robot


*** Keywords ***

Open Application
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Close Application
    Close Browser
