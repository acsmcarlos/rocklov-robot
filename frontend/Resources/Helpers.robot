*** Settings ***
Documentation    Aqui temos as KWs de ajuda

Library    OperatingSystem


*** Keywords ***
Get Equipo
    [Arguments]    ${equipo}

    ${fixture}    Get File    ${EXECDIR}/Resources/Fixtures/Equipos.json
    ${json}       Evaluate    json.loads($fixture)                          json

    ${selectEquipo}    Set Variable    ${json}[${equipo}]

    [Return]    ${selectEquipo}

# LocalStorage - NÃO utilizado, NÃO está funcionando 
# (Aula: https://app.qacademy.io/area/produto/item/213483)
Get Token From LocalStorage

    ${token}   LocalStorage Get Item    user_token

    [Return]    ${token}

Set Token From LocalStorage
    
    ${TOKEN}    Local Storage Get Item     user_token

    Set Test Variable    ${TOKEN}