*** Settings ***
Documentation    Aqui teremos as KW de ajuda

Library    OperatingSystem


*** Keywords ***
# recebendo o arquivo e convertendo em JSON e armazenar
Get Json
    [Arguments]    ${route}    ${file_name}

    ${fixture}    Get File    ${EXECDIR}/resources/fixtures/${route}/${file_name}

    ${json}    Evaluate    json.loads($fixture)    json

    [Return]    ${json}

# Criando a kw TOKEN
Get Token
    [Arguments]    ${email}    ${password}

    &{payload}    Create Dictionary    email=${email}    password=${password}

    ${response}      POST Login      ${payload}
    ${user_token}    Set Variable    ${response.json()}[user_token]

    [Return]    ${user_token}