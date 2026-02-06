*** Settings ***
Resource    ../../resources/Common.robot
Resource    ../../resources/Variables.robot
Resource    ../../pages/LoginPage.robot
Resource    ../../pages/RecruitmentPage.robot

Suite Setup    Prepare Vacancy For Candidate
Suite Teardown    Close Application

*** Keywords ***
Prepare Vacancy For Candidate
    Open Application
    Login As User    ${ADMIN_USER}    ${ADMIN_PASS}
    ${vacancy_name}=    Generate Unique Name    CandidateVacancy
    ${description}=    Generate Unique Name    Candidate vacancy
    Create Vacancy    ${vacancy_name}    Orange Test    ${description}
    Set Suite Variable    ${CANDIDATE_VACANCY}    ${vacancy_name}

*** Test Cases ***
Add Candidate
    [Tags]    regression
    ${first_name}=    Generate Unique Name    CandFirst
    ${last_name}=     Generate Unique Name    CandLast
    ${email}=    Generate Unique Email    candidate
    Add Candidate    ${first_name}    ${last_name}    ${email}    ${CANDIDATE_VACANCY}
