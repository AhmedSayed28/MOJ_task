*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Resource   ../resources/BaseActions.robot
Resource   ../resources/Common.robot

*** Variables ***
# ===== MENUS =====
${RECRUITMENT_MENU}        xpath=//a[contains(@href,'recruitment')]
${VACANCIES_TAB}          css=[class="oxd-topbar-body-nav-tab"] [class="oxd-topbar-body-nav-tab-item"] 
${CANDIDATES_TAB}         xpath=(//input[@class='oxd-input oxd-input--active'])[1]

# ===== COMMON BUTTONS =====
${ADD_BUTTON}             css=[class="oxd-button oxd-button--medium oxd-button--secondary"]
${SAVE_BUTTON}            css=button[type='submit']
${SUBMIT_BUTTON}          css=button[type='submit']

# ===== VACANCY FORM =====
${VACANCY_NAME_FIELD}     xpath=(//input[@class='oxd-input oxd-input--active'])[2]
${VACANCY_JOB_DROPDOWN}   xpath=(//div[contains(@class,'oxd-select-text')])[1]
${VACANCY_MANAGER_FIELD}    css=[class="oxd-autocomplete-text-input oxd-autocomplete-text-input--active"] input
${VACANCY_DESC_FIELD}     css=textarea

# ===== SUCCESS TOAST =====
${SUCCESS_TOAST}          xpath=//div[contains(@class,'oxd-toast')]

# ===== CANDIDATE FORM =====
${CANDIDATE_FIRST_NAME}   name=firstName
${CANDIDATE_LAST_NAME}    name=lastName
${CANDIDATE_EMAIL}        xpath=//input[@type='email']
${VACANCY_DROPDOWN}       xpath=(//div[contains(@class,'oxd-select-text')])[1]

# ===== ATTACHMENT =====
${ATTACHMENT_SECTION}     xpath=//div[contains(@class,'orangehrm-attachment')]

# ===== PAGE TITLES =====
${EDIT_FORM_TITLE}        css=h6.orangehrm-main-title

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
