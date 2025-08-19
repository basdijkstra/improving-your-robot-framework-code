*** Settings ***
Documentation    Exercise 01
Library          SeleniumLibrary

*** Test Cases ***
Order a Sauce Labs Backpack
    Start Chrome  https://www.saucedemo.com
    Wait Until Element Is Enabled    id:user-name
    Input Text    id:user-name  standard_user
    Wait Until Element Is Enabled    id:password
    Input Text    id:password  secret_sauce
    Wait Until Element Is Enabled    id:login-button
    Click Element    id:login-button
    Wait Until Element Is Enabled    xpath://div[text()="Sauce Labs Backpack"]
    Click Element    xpath://div[text()="Sauce Labs Backpack"]
    Wait Until Element Is Enabled    id:add-to-cart
    Click Element    id:add-to-cart
    Wait Until Element Is Enabled    xpath://a[@data-test="shopping-cart-link"]
    Click Element    xpath://a[@data-test="shopping-cart-link"]
    Wait Until Element Is Enabled    id:checkout
    Close Browser

*** Keywords ***
Start Chrome
    [Arguments]    ${url}
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --disable-save-password-bubble
    Call Method    ${options}    add_argument    --disable-password-manager-reenabling
    ${prefs}=    Create Dictionary    credentials_enable_service=${False}    password_manager_enabled=${False}
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Open Browser    ${url}    chrome    options=${options}
    Maximize Browser Window