*** Settings ***
Documentation    Sessions Attempt Signup Tests

Resource         ${EXECDIR}/resources/Base.robot
Test Template    Attempt Signup


*** Test Cases ***    scenario         message
CT001-Empty Name            empty_name       required name
CT002-Empty Email           empty_email      required email
CT003-Empty Password        empty_pass       required password
CT004-Without Name          without_name     required name
CT005-Without Email         without_email    required email
CT006-Without Password      without_pass     required password
CT007-Wrong Email           wrong_email      wrong email


*** Keywords ***
Attempt Signup
    [Arguments]    ${scenario}    ${message}

    ${attempt}    Get Json    signup    attempt.json

    ${response}    POST User    ${attempt['${scenario}']}

    Status Should Be    412    ${response}

    Should Be Equal    ${response.json()}[error]    ${message}