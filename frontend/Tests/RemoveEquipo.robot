*** Settings ***
Documentation    Remove Equipos Test

Resource    ../Resources/Base.robot

Suite Setup      Login Session     ${EMAIL}    ${PASS}
Test Teardown    Finish Session

*** Variables ***
${EMAIL}    jimmi.hendrix@hotmail.com
${PASS}     123456

*** Test Cases ***
CT01-Remove Equipo
    [Tags]    remove

    # Dado que o saxofone um equipamento indesejado
    ${equipo}              Get Equipo           saxofone
    ${token}               Get Token From LocalStorage
    Remove Equipo          ${equipo}[name]
    Post Equipo Service    ${equipo}            ${token}
    Reload

    # Quando solicito a remoção desse equipo
    Click     xpath=//td[text()="${equipo}[name]"]/..//i[contains(@class,"delete")]

    # E confirmo a exclusão
    Click     xpath=//button[contains(text(), "Sim")] 

    # Então esse equipo não deve ser exibido na lista
    Equipo Not Should Be Visible    ${equipo}[name]

CT02-Remove Give Up
    [Tags]    not_remove

    # Dado que a conga um equipamento indesejado
    ${equipo}              Get Equipo           congas
    ${token}               Get Token From LocalStorage
    Remove Equipo          ${equipo}[name]
    Post Equipo Service    ${equipo}            ${token}
    Reload

    # Quando solicito a remoção desse equipo
    Click     xpath=//td[text()="${equipo}[name]"]/..//i[contains(@class,"delete")]

    # E não confirmo a exclusão
    Click     xpath=//button[contains(text(), "Não")] 

    # Então esse equipo não deve ser exibido na lista
    Equipo Should Be Visible    ${equipo}[name]
