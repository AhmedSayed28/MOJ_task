*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/BaseActions.robot

*** Variables ***
${RECRUITMENT_MENU}          xpath=//span[text()='Recruitment']
${VACANCIES_TAB}             xpath=//a[normalize-space()='Vacancies']
${CANDIDATES_TAB}            xpath=//a[normalize-space()='Candidates']
${ADD_BUTTON}                xpath=//button[normalize-space()='Add']
${VACANCY_NAME_FIELD}        xpath=//label[text()='Vacancy Name']/../following-sibling::div/input
${VACANCY_JOB_DROPDOWN}      xpath=//label[text()='Job Title']/../following-sibling::div//div[contains(@class,'oxd-select-text')]
${VACANCY_MANAGER_FIELD}     xpath=//label[text()='Hiring Manager']/../following-sibling::div//input
${VACANCY_DESC_FIELD}        xpath=//label[text()='Description']/../following-sibling::div/textarea
${SAVE_BUTTON}               xpath=//button[normalize-space()='Save']
${SUCCESS_TOAST}             xpath=//p[contains(@class,'oxd-text--toast-message')]
${CANDIDATE_FIRST_NAME}      name=firstName
${CANDIDATE_LAST_NAME}       name=lastName
${CANDIDATE_EMAIL}           xpath=//label[text()='Email']/../following-sibling::div/input
${VACANCY_DROPDOWN}           xpath=//label[text()='Vacancy']/../following-sibling::div//div[contains(@class,'oxd-select-text')]
${SUBMIT_BUTTON}             xpath=//button[normalize-space()='Save']

*** Keywords ***
Navigate To Recruitment
    Smart Click    ${RECRUITMENT_MENU}
    Smart Element Should Be Visible    ${VACANCIES_TAB}

Create Vacancy
    [Arguments]    ${vacancy_name}    ${hiring_manager}    ${description}
    Navigate To Recruitment
    Smart Click    ${VACANCIES_TAB}
    Smart Click    ${ADD_BUTTON}
    Smart Input Text    ${VACANCY_NAME_FIELD}    ${vacancy_name}
    Smart Click    ${VACANCY_JOB_DROPDOWN}
    Smart Click    xpath=//div[@role='option']/span
    Smart Input Text    ${VACANCY_MANAGER_FIELD}    ${hiring_manager}
    Smart Input Text    ${VACANCY_DESC_FIELD}    ${description}
    Smart Click    ${SAVE_BUTTON}
    Smart Element Should Be Visible    ${SUCCESS_TOAST}

Add Candidate
    [Arguments]    ${first_name}    ${last_name}    ${email}    ${vacancy}
    Navigate To Recruitment
    Smart Click    ${CANDIDATES_TAB}
    Smart Click    ${ADD_BUTTON}
    Smart Input Text    ${CANDIDATE_FIRST_NAME}    ${first_name}
    Smart Input Text    ${CANDIDATE_LAST_NAME}    ${last_name}
    Smart Input Text    ${CANDIDATE_EMAIL}    ${email}
    Smart Click    ${VACANCY_DROPDOWN}
    Smart Click    xpath=//div[@role='option']/span[normalize-space()='${vacancy}']
    Smart Click    ${SUBMIT_BUTTON}
    Smart Element Should Be Visible    ${SUCCESS_TOAST}
