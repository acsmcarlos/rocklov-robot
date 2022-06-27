*** Settings ***
Documentation    Seeds Test

Resource    ../Resources/Base.robot

Suite Setup      Create Users

# Arquivo criado para cadastrar os users antes dos testes
*** Keywords ***
Create Users
    ${file}    Get File    ${EXECDIR}/Resources/Fixtures/users_seeds.json

    ${users}    Evaluate    json.loads($file)    json

    FOR     ${user}    IN    @{users}
        Remove User Email    ${user}[email]
        POST User Service    ${user}
    END