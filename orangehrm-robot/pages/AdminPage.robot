*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/BaseActions.robot

*** Variables ***
${ADMIN_MENU}               xpath=//span[text()='Admin']
${ADD_BUTTON}               xpath=//button[normalize-space()='Add']
${USER_ROLE_DROPDOWN}       xpath=//label[text()='User Role']/../following-sibling::div//div[contains(@class,'oxd-select-text')]
${STATUS_DROPDOWN}          xpath=//label[text()='Status']/../following-sibling::div//div[contains(@class,'oxd-select-text')]
${EMPLOYEE_NAME_FIELD}      xpath=//label[text()='Employee Name']/../following-sibling::div//input
${USERNAME_FIELD}           xpath=//label[text()='Username']/../following-sibling::div/input
${PASSWORD_FIELD}           xpath=//label[text()='Password']/../following-sibling::div/input
${CONFIRM_PASSWORD_FIELD}   xpath=//label[text()='Confirm Password']/../following-sibling::div/input
${SAVE_BUTTON}              xpath=//button[normalize-space()='Save']
${SUCCESS_TOAST}            xpath=//p[contains(@class,'oxd-text--toast-message')]

*** Keywords ***
Navigate To Admin
    Smart Click    ${ADMIN_MENU}
    Smart Element Should Be Visible    ${ADD_BUTTON}

Create System User
    [Arguments]    ${employee_name}    ${username}    ${password}
    Navigate To Admin
    Smart Click    ${ADD_BUTTON}
    Smart Click    ${USER_ROLE_DROPDOWN}
    Smart Click    xpath=//div[@role='option']/span[normalize-space()='ESS']
    Smart Input Text    ${EMPLOYEE_NAME_FIELD}    ${employee_name}
    Smart Click    xpath=//div[@role='listbox']//span[contains(@class,'oxd-text')][1]
    Smart Click    ${STATUS_DROPDOWN}
    Smart Click    xpath=//div[@role='option']/span[normalize-space()='Enabled']
    Smart Input Text    ${USERNAME_FIELD}    ${username}
    Smart Input Text    ${PASSWORD_FIELD}    ${password}
    Smart Input Text    ${CONFIRM_PASSWORD_FIELD}    ${password}
    Smart Click    ${SAVE_BUTTON}
    Smart Element Should Be Visible    ${SUCCESS_TOAST}
