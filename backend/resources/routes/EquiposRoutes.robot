*** Settings ***
Documentation    Implementação da Rota / Equipos

Library    OperatingSystem    # Biblioteca para obter a kw = Get Binary File

*** Keywords ***
POST Equipo
    [Arguments]    ${equipo}    ${token}

    # Receber o TOKEN
    &{headers}    Create Dictionary    user_token=${token}

    # Recebendo a pasta thumbnails(imagens)
    ${bin_image}    Get Binary File      ${EXECDIR}/resources/fixtures/equipos/thumbnails/${equipo}[thumbnail]
    # Enviando a imagem através da API
    &{thumbnail}    Create Dictionary    thumbnail=${bin_image}


    ${response}    POST                       
    ...            ${base_url}/equipos        
    ...            data=${equipo}[payload]    # <---- trocado "json" por "data(data-format)"
    ...            headers=${headers}
    ...            files=${thumbnail}
    ...            expected_status=any

    [Return]    ${response}

GET Unique Equipo
    [Arguments]    ${token}    ${equipo_id}
    
    # Receber o TOKEN
    &{headers}    Create Dictionary    user_token=${token}
    
    ${response}    GET                       
    ...            ${base_url}/equipos/${equipo_id}
    ...            headers=${headers}
    ...            expected_status=any
    
    [Return]    ${response}

GET All Equipos
    [Arguments]    ${token}
    
    # Receber o TOKEN
    &{headers}    Create Dictionary    user_token=${token}
    
    ${response}    GET                       
    ...            ${base_url}/equipos
    ...            headers=${headers}
    ...            expected_status=any
    
    [Return]    ${response}

DELETE Unique Equipo
    [Arguments]    ${token}    ${equipo_id}
    
    # Receber o TOKEN
    &{headers}    Create Dictionary    user_token=${token}
    
    ${response}    DELETE                       
    ...            ${base_url}/equipos/${equipo_id}
    ...            headers=${headers}
    ...            expected_status=any
    
    [Return]    ${response}
