*** Settings ***
Documentation    Login Page
Resource    ../common.resource

*** Variables ***
${textfield_username}  id:user-name
${textfield_password}  id:password
${button_login}  id:login-button

*** Keywords ***
Login As
    [Arguments]    ${username}  ${password}
    Wait And Type    ${textfield_username}  ${username}
    Wait And Type    ${textfield_password}  ${password}
    Wait And Click    ${button_login}