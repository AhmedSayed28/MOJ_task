*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/BaseActions.robot
Resource   ../resources/Common.robot

*** Variables ***
${LOGIN_USER_FIELD}        name=username
${LOGIN_PASS_FIELD}        name=password
${LOGIN_BUTTON}            css=button[type='submit']
${DASHBOARD_HEADER}        xpath=//h6[text()='Dashboard']
${USER_DROPDOWN}           css=.oxd-userdropdown-tab
${LOGOUT_LINK}             xpath=//a[text()='Logout']

*** Keywords ***
Login As Admin
    ${username}=    Get Test Data Value    admin    username
    ${password}=    Get Test Data Value    admin    password
    Smart Input Text    ${LOGIN_USER_FIELD}    ${username}
    Smart Input Text    ${LOGIN_PASS_FIELD}    ${password}
    Smart Click    ${LOGIN_BUTTON}
    Smart Element Should Be Visible    ${DASHBOARD_HEADER}

Login As System User
    ${username}=    Get Test Data Value    user    username
    ${password}=    Get Test Data Value    user    password
    Smart Input Text    ${LOGIN_USER_FIELD}    ${username}
    Smart Input Text    ${LOGIN_PASS_FIELD}    ${password}
    Smart Click    ${LOGIN_BUTTON}
    Smart Element Should Be Visible    ${DASHBOARD_HEADER}

Logout
    Smart Click    ${USER_DROPDOWN}
    Smart Click    ${LOGOUT_LINK}
    Smart Element Should Be Visible    ${LOGIN_BUTTON}

Verify Dashboard Visible
    Smart Element Should Be Visible    ${DASHBOARD_HEADER}
