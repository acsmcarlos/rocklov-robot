*** Settings ***
Documentation    Sessions Attempt Login Tests

Resource         ${EXECDIR}/resources/Base.robot
Test Template    Attempt Login


*** Test Cases ***    json_file                status_code    message
CT001-Incorrect Password    incorrect_pass.json      401            Unauthorized
CT002-User Not Found        user_not_found.json      401            Unauthorized
CT003-Incorrect Email       wrong_email.json         412            wrong email 
CT004-Empty Email           empty_email.json         412            required email 
CT005-Empty Password        empty_password.json      412            required password
CT006-Without Email         without_email.json       412            required email
CT007-Without Password      without_password.json    412            required password
CT008-Empty Fields          empty_fields.json        412            required email


*** Keywords ***
Attempt Login
    [Arguments]    ${json_file}    ${status_code}    ${message}

    ${payload}          Get Json                     sessions       ${json_file}
    ${response}         POST Login                   ${payload}
    Status Should Be    ${status_code}               ${response}
    Should Be Equal     ${response.json()}[error]    ${message}