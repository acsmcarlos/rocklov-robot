*** Settings ***
Documentation    DELETE Equipos Tests

Resource    ${EXECDIR}/resources/Base.robot

*** Test Cases ***
CT001-Delete Equipo ID

    # Dado que eu faço a autenticação no sistema
    ${token}     Get Token    sambora@bonjovi.com    123456

    # Quando insiro uma massa de teste
    ${equipo}    Get Json     equipos                violino.json

    # Quando removo um equipo
    Remove Equipo    ${equipo}[payload][name]

    # E cadastro novo Equipo
    ${result}       POST Equipo     ${equipo}                 ${token}
    ${equipo_id}    Set Variable    ${result.json()}[_id] 

    # E faço uma requisição DELETE e GET na rota /equipos
    ${response}      DELETE Unique Equipo    ${token}    ${equipo_id}
    ${response_2}    GET Unique Equipo       ${token}    ${equipo_id}

    # Então o código de status deve ser 204 e 404
    Status Should Be    204    ${response}
    Status Should Be    404    ${response_2}


CT002-Equipo Not Found

    ${equipo_id}      Get Mongo Id
    # Log To Console    \nID: ${equipo_id}

    ${token}       Get Token               sambora@bonjovi.com    123456
    ${response}    DELETE Unique Equipo    ${token}               ${equipo_id}

    # Na API está 204 para busca de registro excluido
    Status Should Be    204    ${response}
