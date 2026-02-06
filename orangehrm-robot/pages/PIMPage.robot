*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/BaseActions.robot
Resource   ../resources/Common.robot

*** Variables ***
${PIM_MENU}                 xpath=//span[text()='PIM']
${ADD_EMPLOYEE_BUTTON}      xpath=//button[normalize-space()='Add']
${FIRST_NAME_FIELD}         name=firstName
${LAST_NAME_FIELD}          name=lastName
${EMPLOYEE_ID_FIELD}        xpath=//label[text()='Employee Id']/../following-sibling::div/input
${SAVE_BUTTON}              xpath=//button[normalize-space()='Save']
${PERSONAL_DETAILS_HEADER}  xpath=//h6[text()='Personal Details']
${EMPLOYEE_LIST_TAB}        xpath=//a[normalize-space()='Employee List']
${EMP_NAME_SEARCH_FIELD}    xpath=//label[text()='Employee Name']/../following-sibling::div//input
${SEARCH_BUTTON}            xpath=//button[normalize-space()='Search']
${RESULTS_TABLE}            xpath=//div[@class='oxd-table-body']
${RESULT_NAME_CELL}         xpath=//div[@class='oxd-table-cell oxd-padding-cell'][3]

*** Keywords ***
Navigate To PIM
    Smart Click    ${PIM_MENU}
    Smart Element Should Be Visible    ${ADD_EMPLOYEE_BUTTON}

Add Employee From Data
    ${first_name}=    Get Test Data Value    employee    firstName
    ${last_name}=     Get Test Data Value    employee    lastName
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
