*** Settings ***
Documentation    Answer 03
Library          SeleniumLibrary
Resource    resources/common.resource
Resource    resources/pages/login.resource
Resource    resources/pages/article.resource
Resource    resources/pages/shoppingcart.resource
Test Setup    Start Chrome  https://www.saucedemo.com
Test Teardown    Close Browser
Test Template    Order an item from the Sauce Labs shop

*** Test Cases ***
Order a Sauce Labs Backpack  Sauce Labs Backpack
Order a Sauce Labs Bike Light  Sauce Labs Bike Light
Order a Sauce Labs Fleece Jacket  Sauce Labs Fleece Jacket

*** Keywords ***
Order an item from the Sauce Labs shop
    [Arguments]    ${item}
    Login As  standard_user  secret_sauce
    Add Article To Cart  ${item}
    Check That Shopping Cart Can Be Opened