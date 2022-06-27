*** Settings ***
Documentation    Aqui vamos consumir a API da Rocklov como um benefício

Resource    Base.robot

*** Variables ***
${base_url}    https://rocklov-antonio-api.herokuapp.com


*** Keywords ***
POST User Service
    [Arguments]    ${payload}

    ${response}    POST
    ...            ${base_url}/signup
    ...            json=${payload}

    [Return]    ${response}


Get Token Service
    [Arguments]    ${email}    ${password}

    &{payload}    Create Dictionary    email=${email}    password=${password}

    ${response}    POST
    ...            ${base_url}/sessions
    ...            json=${payload}
    ...            expected_status=any

    [Return]    ${response.json()}[user_token]


Post Equipo Service
    [Arguments]    ${equipo}    ${token}

    # Receber o TOKEN
    &{headers}    Create Dictionary    user_token=${token}

    # Recebendo a pasta thumbnails(imagens)
    ${bin_image}    Get Binary File      ${EXECDIR}/Resources/Fixtures/Thumbnails/${equipo}[thumbnail]
    # Enviando a imagem através da API
    &{thumbnail}    Create Dictionary    thumbnail=${bin_image}


    ${response}    POST                   
    ...            ${base_url}/equipos    
    ...            data=${equipo}         # <---- trocado "json" por "data(data-format)"
    ...            headers=${headers}
    ...            files=${thumbnail}
    ...            expected_status=any

    [Return]    ${response}