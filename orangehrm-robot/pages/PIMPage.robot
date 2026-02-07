*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Resource   ../resources/BaseActions.robot
Resource   ../resources/Common.robot

*** Variables ***
${PIM_MENU}                 xpath=//a[contains(@href,'pim')]
${ADD_EMPLOYEE_BUTTON}      css=[class="oxd-button oxd-button--medium oxd-button--secondary"]
${FIRST_NAME_FIELD}         name=firstName
${LAST_NAME_FIELD}          name=lastName
${EMPLOYEE_ID_FIELD}        css=[class="oxd-input-group oxd-input-field-bottom-space"] [class="oxd-input oxd-input--active"]
${SAVE_BUTTON}              css=[class="oxd-button oxd-button--medium oxd-button--secondary orangehrm-left-space"]
${PERSONAL_DETAILS_HEADER}  xpath=(//h6[@class="oxd-text oxd-text--h6 orangehrm-main-title"])[1]
${EMPLOYEE_LIST_TAB}        xpath=(//li[@class='oxd-topbar-body-nav-tab --visited'])[1]
${EMP_NAME_SEARCH_FIELD}    xpath=//div[@class="oxd-grid-4 orangehrm-full-width-grid"] //div[@class="oxd-grid-item oxd-grid-item--gutters"][1] //input
${SEARCH_BUTTON}            xpath=button[type='submit']
${RESULTS_TABLE}            xpath=//div[@class='oxd-table-body']
${RESULT_NAME_CELL}         xpath=//div[@class='oxd-table-cell oxd-padding-cell'][3]

*** Keywords ***
Navigate To PIM
    Smart Click    ${PIM_MENU}
    Smart Element Should Be Visible    ${ADD_EMPLOYEE_BUTTON}

Add Employee From Data
    ${first_name}=    Get Test Data Value    employee    firstName
    ${last_name}=     Get Test Data Value    employee    lastName
    ${TIMESTAMP}=    Get Current Date    result_format=%Y%m%d%H%M%S
    Navigate To PIM
    Smart Click    ${ADD_EMPLOYEE_BUTTON}
    Smart Input Text    ${FIRST_NAME_FIELD}    ${first_name}
    Smart Input Text    ${LAST_NAME_FIELD}    ${last_name}
    ${employee_id}=    Smart Get Value    ${EMPLOYEE_ID_FIELD}
    Smart Click    ${SAVE_BUTTON}
    Smart Element Should Be Visible    ${PERSONAL_DETAILS_HEADER}
    RETURN    ${employee_id}

Search Employee By Name From Data
    ${employee_name}=    Get Employee Full Name From Data
    Navigate To PIM
    Smart Click    ${EMPLOYEE_LIST_TAB}
    Smart Input Text    ${EMP_NAME_SEARCH_FIELD}    ${employee_name}
    Smart Click    ${SEARCH_BUTTON}
    Smart Element Should Be Visible    ${RESULTS_TABLE}

Verify Employee Appears In Results From Data
    ${employee_name}=    Get Employee Full Name From Data
    ${result_name}=    Smart Get Text    ${RESULT_NAME_CELL}
    Should Contain    ${employee_name}    ${result_name}    
