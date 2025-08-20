*** Settings ***
Documentation    ParaBank loan application example
Library    RequestsLibrary
Test Template    Submit a loan application and check the result

*** Test Cases ***
A 999 dollar loan is approved    999    10    True
A 1 dollar loan is approved    1    1    True

*** Keywords ***
Submit a loan application and check the result
    [Arguments]    ${amount}    ${down_payment}    ${expected_result}
    Create Session    parabank    http://localhost:8080/parabank/services/bank    headers={'Accept': 'application/json'}
    ${response}    POST On Session    parabank    url=/requestLoan?customerId=12212&amount=${amount}&downPayment=${downPayment}&fromAccountId=12345
    Status Should Be    200    ${response}
    Should Be Equal As Strings    ${expected_result}    ${response.json()}[approved]