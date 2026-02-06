*** Settings ***
Resource    ../../resources/Common.robot
Resource    ../../resources/Variables.robot
Resource    ../../pages/LoginPage.robot
Resource    ../../pages/RecruitmentPage.robot

Test Setup       Open Application
Test Teardown    Close Application

*** Test Cases ***
Create Vacancy
    [Tags]    smoke
    Login As User    ${ADMIN_USER}    ${ADMIN_PASS}
    ${vacancy_name}=    Generate Unique Name    Vacancy
    ${description}=    Generate Unique Name    Automation vacancy
    Create Vacancy    ${vacancy_name}    Orange Test    ${description}
