*** Settings ***
Resource    ../../resources/Common.robot
Resource    ../../resources/Variables.robot
Resource    ../../pages/LoginPage.robot
Resource    ../../pages/RecruitmentPage.robot

Suite Setup    Load Test Data
Test Setup       Open Application
Test Teardown    Close Application

*** Test Cases ***
Create Vacancy
    [Tags]    smoke
    Login As Admin
    Create Vacancy From Data
