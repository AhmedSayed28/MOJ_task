*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Resource   ../resources/BaseActions.robot
Resource   ../resources/Common.robot

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
${SUCCESS_TOAST}             xpath=//div[@id="oxd-toaster_1"]
${CANDIDATE_FIRST_NAME}      name=firstName
${CANDIDATE_LAST_NAME}       name=lastName
${CANDIDATE_EMAIL}           xpath=//label[text()='Email']/../following-sibling::div/input
${VACANCY_DROPDOWN}           xpath=//label[text()='Vacancy']/../following-sibling::div//div[contains(@class,'oxd-select-text')]
${ATTACHMENT_SECTION}           xpath=//div[@class="orangehrm-header-container orangehrm-attachment-header"]
${SUBMIT_BUTTON}             xpath=//button[normalize-space()='Save']
${EDIT_FORM_TITLE}             //h6[@class="oxd-text oxd-text--h6 orangehrm-main-title"]

*** Keywords ***
Navigate To Recruitment
    Smart Click    ${RECRUITMENT_MENU}
    Smart Element Should Be Visible    ${VACANCIES_TAB}

Create Vacancy From Data
    ${vacancy_name}=    Get Test Data Value    vacancy    title
    ${hiring_manager}=    Get Test Data Value    vacancy    hiringManager
    ${description}=    Get Test Data Value    vacancy    description
    ${TIMESTAMP}=    Get Current Date    result_format=%Y%m%d%H%M%S
    Navigate To Recruitment
    Smart Click    ${VACANCIES_TAB}
    Smart Click    ${ADD_BUTTON}
    Smart Input Text    ${VACANCY_NAME_FIELD}    ${vacancy_name}_${TIMESTAMP}
    Smart Click    ${VACANCY_JOB_DROPDOWN}
    Smart Click    xpath=//div[@role='option']/span
    Smart Input Text    ${VACANCY_MANAGER_FIELD}    ${hiring_manager}
    Smart Click    xpath=//div[@role='option']/span
    Smart Input Text    ${VACANCY_DESC_FIELD}    ${description}
    Smart Click    ${SAVE_BUTTON}
    Smart Wait For Element   ${ATTACHMENT_SECTION}
    ${new_form_title}=    Smart Get Text    ${EDIT_FORM_TITLE}
    Should Be Equal    ${new_form_title}    Edit Vacancy


Add Candidate From Data
    ${first_name}=    Get Test Data Value    candidate    firstName
    ${last_name}=     Get Test Data Value    candidate    lastName
    ${email}=    Get Test Data Value    candidate    email
    ${vacancy}=    Get Test Data Value    vacancy    title
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
