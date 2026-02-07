*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Resource   ../resources/keywords/BaseActions.robot
Resource   ../resources/keywords/Common.robot

*** Variables ***
${ADMIN_MENU}               xpath=//a[contains(@href,'admin')]
${ADD_BUTTON}               css=[class="oxd-button oxd-button--medium oxd-button--secondary"]
${USER_ROLE_DROPDOWN}       css=[class="oxd-form-row"] [class="oxd-grid-item oxd-grid-item--gutters"]:nth-child(1) div[class="oxd-select-text oxd-select-text--active"]
${STATUS_DROPDOWN}          css=[class="oxd-form-row"] [class="oxd-grid-item oxd-grid-item--gutters"]:nth-child(3) div[class="oxd-select-text oxd-select-text--active"]
${EMPLOYEE_NAME_FIELD}      css=[class="oxd-autocomplete-text-input oxd-autocomplete-text-input--active"] input
${USERNAME_FIELD}           css=[class="oxd-form-row"] [class="oxd-grid-item oxd-grid-item--gutters"]:nth-child(4) input
${PASSWORD_FIELD}           xpath=(//input[@type='password'])[1]
${CONFIRM_PASSWORD_FIELD}   xpath=(//input[@type='password'])[2]
${SAVE_BUTTON}              css=[class="oxd-button oxd-button--medium oxd-button--secondary orangehrm-left-space"]
${SUCCESS_TOAST}            xpath=//p[contains(@class,'oxd-text--toast-message')]
${USER_DROPDOWN_OPTION}    xpath=//div[@role='option']/span[normalize-space()='ESS']
${EMP_NAME_SUGGESTION}       css=div[role="listbox"] div[role="option"]:nth-child(1) span
${STATUS_DROPDOWN_OPTION}    xpath=//div[@role='option']/span[normalize-space()='Enabled']    

*** Keywords ***
Navigate To Admin
    Smart Click    ${ADMIN_MENU}
    Smart Element Should Be Visible    ${ADD_BUTTON}

Create System User From Data
    ${employee_name}=    Get Employee Full Name From Data
    ${username}=    Get Test Data Value    user    username
    ${password}=    Get Test Data Value    user    password
    ${TIMESTAMP}=    Get Current Date    result_format=%Y%m%d%H%M%S
    Navigate To Admin
    Smart Click    ${ADD_BUTTON}
    Smart Click    ${USER_ROLE_DROPDOWN}
    Smart Click    ${USER_DROPDOWN_OPTION}
    Smart Input Text    ${EMPLOYEE_NAME_FIELD}    ${employee_name}
    Smart Click    ${EMP_NAME_SUGGESTION}
    Smart Click    ${STATUS_DROPDOWN}
    Smart Click    ${STATUS_DROPDOWN_OPTION}
    ${generated_username}=    Catenate    ${username}_${TIMESTAMP}
    Smart Input Text    ${USERNAME_FIELD}    ${generated_username}
    Smart Input Text    ${PASSWORD_FIELD}    ${password}
    Smart Input Text    ${CONFIRM_PASSWORD_FIELD}    ${password}
    Smart Click    ${SAVE_BUTTON}
    Smart Element Should Be Visible    ${SUCCESS_TOAST}
    Set Created Username    ${generated_username}
