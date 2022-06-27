*** Settings ***
Documentation    GET Equipos Tests

Resource    ${EXECDIR}/resources/Base.robot

*** Test Cases ***
CT001-Get Equipo ID

    # Dado que eu faço a autenticação no sistema
    ${token}     Get Token    sambora@bonjovi.com    123456
    ${equipo}    Get Json     equipos                piano.json

    # Quando removo um equipo
    Remove Equipo    ${equipo}[payload][name]

    ${result}       POST Equipo     ${equipo}                 ${token}
    ${equipo_id}    Set Variable    ${result.json()}[_id] 

    # e faço uma requisição GET na rota /equipos
    ${response}    GET Unique Equipo    ${token}    ${equipo_id}

    # Então o código de status deve ser 200
    Status Should Be    200    ${response}

    # Validações
    Should Be Equal    ${equipo}[payload][name]        ${response.json()}[name]
    Should Be Equal    ${equipo}[payload][category]    ${response.json()}[category]
    Should Be Equal    ${equipo}[payload][price]       ${response.json()}[price]


CT002-Equipo Not Found

    ${equipo_id}    Get Mongo Id

    ${token}       Get Token            sambora@bonjovi.com    123456
    ${response}    GET Unique Equipo    ${token}               ${equipo_id}

    Status Should Be    404    ${response}


CT003-Get Equipo List
    [Tags]    all_equipos

    # Autenticando
    ${token}    Get Token    rita.lee@gmail.com    123456

    # Setando as 04 massas de teste e deletando os equipos
    ${list}    Get Json    equipos    list.json

    # LOOP para percorrer a lista e cadastrar os equipos
    FOR    ${item}    IN    @{list}
        Remove Equipo    ${item}[payload][name]
        POST Equipo      ${item}     ${token}
    END

    ${response}         GET All Equipos    ${token}
    Status Should Be    200                ${response}

    ${total_list}     Get Length           ${response.json()}
    Should Be True    ${total_list} > 3