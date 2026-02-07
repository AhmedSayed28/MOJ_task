*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/BaseActions.robot
Resource   ../resources/Common.robot

*** Variables ***
${LOGIN_USER_FIELD}        name=username
${LOGIN_PASS_FIELD}        name=password
${LOGIN_BUTTON}            css=button[type='submit']
${DASHBOARD_HEADER}        css=[class="oxd-text oxd-text--h6 oxd-topbar-header-breadcrumb-module"]
${USER_DROPDOWN}           css=.oxd-userdropdown-tab
${LOGOUT_LINK}             xpath=//a[contains(@href,'logout')]

*** Keywords ***
Login As Admin
    ${username}=    Get Test Data Value    admin    username
    ${password}=    Get Test Data Value    admin    password
    Smart Input Text    ${LOGIN_USER_FIELD}    ${username}
    Smart Input Text    ${LOGIN_PASS_FIELD}    ${password}
    Smart Click    ${LOGIN_BUTTON}
    Smart Element Should Be Visible    ${DASHBOARD_HEADER}

Login As System User
    ${created}=    Get Variable Value    ${CREATED_USERNAME}    ${EMPTY}
    ${username}=    Run Keyword If    '${created}' != '${EMPTY}'    Set Variable    ${created}    ELSE    Get Test Data Value    user    username
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
