*** Settings ***
Documentation    Seeds

Resource         ${EXECDIR}/resources/Base.robot

Suite Setup    Create Users


*** Keywords ***
Create Users
    ${users}    Get Json    signup    users_seeds.json

    # LOOP para percorrer a lista e cadastrar os USUÁRIOS
    FOR    ${user}    IN    @{users}
        POST User    ${user}
    END