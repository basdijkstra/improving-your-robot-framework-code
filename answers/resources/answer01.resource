*** Settings ***
Documentation    Common keywords for SeleniumLibrary
Library    SeleniumLibrary

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

Start Firefox
    [Arguments]    ${url}
    Open Browser    ${url}    firefox
    Maximize Browser Window

Wait And Type
    [Arguments]    ${locator}  ${value}
    Wait Until Element Is Enabled    ${locator}
    Input Text    ${locator}  ${value}

Wait And Click
    [Arguments]    ${locator}
    Wait Until Element Is Enabled    ${locator}
    Click Element    ${locator}