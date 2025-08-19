*** Settings ***
Documentation    Answer 01
Library          SeleniumLibrary
Resource    resources/answer01.resource
Test Setup    Start Chrome  https://www.saucedemo.com
Test Teardown    Close Browser  

*** Test Cases ***
Order a Sauce Labs Backpack
    Wait And Type    id:user-name  standard_user
    Wait And Type    id:password  secret_sauce
    Wait And Click   id:login-button
    Wait And Click   xpath://div[text()="Sauce Labs Backpack"]
    Wait And Click   id:add-to-cart
    Wait And Click   xpath://a[@data-test="shopping-cart-link"]
    Wait Until Element Is Enabled    id:checkout
