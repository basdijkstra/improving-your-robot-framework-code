*** Settings ***
Documentation    Login Page
Resource    ../common.resource

*** Variables ***
${textfield_username}  id:user-name
${textfield_password}  id:password
${button_login}  id:login-button

*** Keywords ***
Set Username
    [Arguments]    ${username}
    Wait And Type    ${textfield_username}  ${username}

Set Password
    [Arguments]    ${password}
    Wait And Type    ${textfield_password}  ${password}

Click Login Button
    Wait And Click    ${button_login}