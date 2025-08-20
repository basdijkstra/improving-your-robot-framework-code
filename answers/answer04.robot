*** Settings ***
Documentation    Answer 04
Library    RequestsLibrary
Test Template    GET user data and check name

*** Test Cases ***
User 1 is Leanne Graham    1    Leanne Graham
User 2 is Ervin Howell     2    Ervin Howell
User 3 is Clementine Bauch    3    Clementine Bauch

*** Keywords ***
GET user data and check name
    [Arguments]    ${user_id}    ${expected_name}
    Create Session  typicode    https://jsonplaceholder.typicode.com
    ${response}    GET On Session    typicode    /users/${user_id}
    Status Should Be    200    ${response}
    Should Be Equal As Strings    ${expected_name}    ${response.json()}[name]