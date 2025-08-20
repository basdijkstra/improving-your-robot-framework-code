*** Settings ***
Documentation    Exercise 04
Library    RequestsLibrary

*** Test Cases ***
User 1 is Leanne Graham
    Create Session  typicode    https://jsonplaceholder.typicode.com
    ${response}    GET On Session    typicode    /users/1
    Status Should Be    200    ${response}
    Should Be Equal As Strings    Leanne Graham    ${response.json()}[name]

User 2 is Ervin Howell
    Create Session  typicode    https://jsonplaceholder.typicode.com
    ${response}    GET On Session    typicode    /users/2
    Status Should Be    200    ${response}
    Should Be Equal As Strings    Ervin Howell    ${response.json()}[name]

User 3 is Clementine Bauch
    Create Session  typicode    https://jsonplaceholder.typicode.com
    ${response}    GET On Session    typicode    /users/3
    Status Should Be    200    ${response}
    Should Be Equal As Strings    Clementine Bauch    ${response.json()}[name]