*** Settings ***
Documentation    Login Page
Resource    ../common.resource

*** Keywords ***
Add Article To Cart
    [Arguments]    ${article}
    Wait And Click   xpath://div[text()="${article}"]
    Wait And Click   id:add-to-cart