*** Settings ***
Documentation    Exercise 02
Library          SeleniumLibrary
Resource    resources/common.resource
Resource    resources/pages/login.resource
Test Setup    Start Chrome  https://www.saucedemo.com
Test Teardown    Close Browser

*** Test Cases ***
Order a Sauce Labs Backpack
    Set Username  standard_user
    Set Password  secret_sauce
    Click Login Button
    Wait And Click   xpath://div[text()="Sauce Labs Backpack"]
    Wait And Click   id:add-to-cart
    Wait And Click   xpath://a[@data-test="shopping-cart-link"]
    Wait Until Element Is Enabled    id:checkout