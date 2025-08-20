*** Settings ***
Documentation    Answer 05
Library          SeleniumLibrary
Test Setup    Start Chrome  https://www.saucedemo.com
Test Teardown    Close Browser

*** Variables ***
${USERNAME}  standard_user
${PASSWORD}   secret_sauce

*** Test Cases ***
Order a Sauce Labs Backpack
    [Documentation]    Checks that the standard user can order a Sauce Labs Backpack
    Wait And Type    id:user-name  ${USERNAME}
    Wait And Type    id:password  ${PASSWORD}
    Wait And Click   id:login-button
    Wait And Click   xpath://div[text()="Sauce Labs Backpack"]
    Wait And Click   id:add-to-cart
    Wait And Click   xpath://a[@data-test="shopping-cart-link"]
    Wait Until Element Is Enabled    id:checkout

*** Keywords ***
Start Chrome
    [Documentation]    Starts a new Chrome instance, disabling the password manager
    [Arguments]    ${url}
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --disable-save-password-bubble
    Call Method    ${options}    add_argument    --disable-password-manager-reenabling
    VAR    &{prefs}    credentials_enable_service=${False}    password_manager_enabled=${False}
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Open Browser    ${url}    chrome    options=${options}
    Maximize Browser Window

Start Firefox
    [Documentation]    Starts a new Firefox instance
    [Arguments]    ${url}
    Open Browser    ${url}    firefox
    Maximize Browser Window

Wait And Type
    [Documentation]    Waits for an element to be enabled, then types text into it
    [Arguments]    ${locator}  ${value}
    Wait Until Element Is Enabled    ${locator}
    Input Text    ${locator}  ${value}

Wait And Click
    [Documentation]    Waits for an element to be enabled, then clicks it
    [Arguments]    ${locator}
    Wait Until Element Is Enabled    ${locator}
    Click Element    ${locator}
