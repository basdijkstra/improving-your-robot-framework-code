*** Settings ***
Documentation    Exercise 03
Library          SeleniumLibrary
Resource    ../answers/resources/common.resource
Resource    ../answers/resources/pages/login.resource
Resource    ../answers/resources/pages/article.resource
Resource    ../answers/resources/pages/shoppingcart.resource
Test Setup    Start Chrome  https://www.saucedemo.com
Test Teardown    Close Browser

*** Test Cases ***
Order a Sauce Labs Backpack
    Login As  standard_user  secret_sauce
    Add Article To Cart    Sauce Labs Backpack
    Check That Shopping Cart Can Be Opened

Order a Sauce Labs Bike Light
    Login As  standard_user  secret_sauce
    Add Article To Cart    Sauce Labs Bike Light
    Check That Shopping Cart Can Be Opened

Order a Sauce Labs Fleece Jacket
    Login As  standard_user  secret_sauce
    Add Article To Cart    Sauce Labs Fleece Jacket
    Check That Shopping Cart Can Be Opened