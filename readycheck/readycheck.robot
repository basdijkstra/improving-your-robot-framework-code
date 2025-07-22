*** Settings ***
Documentation    Ready check
Library          RequestsLibrary
Library          SeleniumLibrary

*** Test Cases ***
Retrieve data for user 1 and check the response status code
    Create Session  zip  https://jsonplaceholder.typicode.com
    ${response}  GET On Session  zip  /users/1
    Status Should Be    200  ${response}

Open a browser and navigate to a test page
    Open Browser  https://www.ontestautomation.com  chrome
    Maximize Browser Window
    Title Should Be  On Test Automation
    Close Browser