*** Settings ***
Documentation    Answer 02
Library          SeleniumLibrary
Resource    resources/common.resource
Resource    resources/pages/login.resource
Resource    resources/pages/article.resource
Resource    resources/pages/shoppingcart.resource
Test Setup    Start Chrome  https://www.saucedemo.com
Test Teardown    Close Browser

*** Test Cases ***
Order a Sauce Labs Backpack
    Login As  standard_user  secret_sauce
    Add Article To Cart    Sauce Labs Backpack
    Check That Shopping Cart Can Be Opened