*** Settings ***
Documentation    Add Equipos Tests

Resource    ${EXECDIR}/resources/Base.robot


*** Test Cases ***
CT001-Add New Equipo

    ${token}      Get Token    sambora@bonjovi.com    123456
    ${equipo}    Get Json     equipos                fender.json

    Remove Equipo    ${equipo}[payload][name]

    ${response}    POST Equipo    ${equipo}    ${token}

    Status Should Be    200    ${response}
