*** Settings ***
Documentation    ParaBank loan application example
Library    SeleniumLibrary
Test Setup    Start Chrome    http://localhost:8080/parabank
Test Teardown    Close Browser
Test Template    Submit a loan application and check the result

*** Test Cases ***
A 999 dollar loan is approved    999    10    Approved
A 1 dollar loan is approved    1    1    Approved

*** Keywords ***
Submit a loan application and check the result
    [Arguments]    ${amount}    ${down_payment}    ${expected_result}
    Wait And Type    name:username    john
    Wait And Type    name:password    demo
    Wait And Click   xpath://input[@value='Log In']
    Wait And Click   link:Request Loan
    Wait And Type    id:amount    ${amount}
    Wait And Type    id:downPayment    ${down_payment}
    Wait And Select  id:fromAccountId    12345
    Wait And Click   xpath://input[@value='Apply Now']
    ${result}  Get Element Text  id:loanStatus
    Should Be Equal As Strings  ${result}    ${expected_result}

Start Chrome
    [Arguments]    ${url}
    Open Browser    ${url}    chrome
    Maximize Browser Window

Start Firefox
    [Arguments]    ${url}
    Open Browser    ${url}  firefox
    Maximize Browser Window

Wait And Type
    [Arguments]    ${locator}  ${value}
    Wait Until Element Is Enabled    ${locator}
    Input Text    ${locator}  ${value}

Wait And Click
    [Arguments]    ${locator}
    Wait Until Element Is Enabled    ${locator}
    Click Element    ${locator}

Wait And Select
    [Arguments]    ${locator}    ${text}
    Wait Until Element Is Enabled    ${locator}
    Select From List By Value    ${locator}    ${text}

Get Element Text
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}
    ${result}    Get Text    ${locator}
    [Return]    ${result}