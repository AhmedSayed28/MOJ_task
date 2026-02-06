*** Settings ***
Resource    ../../resources/Common.robot
Resource    ../../resources/Variables.robot
Resource    ../../pages/LoginPage.robot
Resource    ../../pages/RecruitmentPage.robot

Suite Setup    Prepare Vacancy For Candidate
Test Teardown    Close Application

*** Keywords ***
Prepare Vacancy For Candidate
    Load Test Data
    Open Application
    Login As Admin
    Create Vacancy From Data

*** Test Cases ***
Add Candidate
    [Tags]    regression
    Add Candidate From Data
