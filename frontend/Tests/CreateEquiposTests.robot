*** Settings ***
Documentation    Equipos Test

Resource    ../Resources/Base.robot

Suite Setup      Login Session     ${EMAIL}    ${PASS}
Test Teardown    Finish Session

*** Variables ***
${EMAIL}    eddie@vanhalen.com
${PASS}     123456

*** Test Cases ***
CT01-Add New Equipo
    [Tags]    add_equipo

    ${equipo}        Get Equipo         violao
    Remove Equipo    ${equipo}[name]

    Go To Equipo Form
    Fill Equipo Form      ${equipo}
    Submit Equipo Form

    # validar se o equipo foi cadastrado
    Equipo Should Be Visible    ${equipo}[name]

CT02-Duplicated Equipo
    [Tags]    dup

    # Dado que o equipo fender já foi cadastrado na minha conta
    ${equipo}              Get Equipo           fender
    ${token}               Get Token Service    ${EMAIL}    ${PASS}
    Post Equipo Service    ${equipo}            ${token}

    # Quando faço o cadastro desse equipamento fender novamente
    Go To Equipo Form
    Fill Equipo Form      ${equipo}
    Submit Equipo Form

    # Então devo ver a mensagem de alerta Anúncio já existe :/
    Wait For Elements State    css=.alert >> text=Anúncio já existe :/    visible    5
    Alert Text Should Be       Anúncio já existe :/

    [Teardown]    Take Screenshot & Go Back    # tirar screenshot e voltar uma tela para executar o próximo teste

CT03-Required Fields
    [Tags]    required

    ### Validando campos obrigatórios com listas ###
    @{expect_alerts}    Create List                          
    ...                 Adicione uma foto no seu anúncio.
    ...                 Informe a descrição do anúncio.
    # ...                 Escolha uma categoria.
    ...                 Selecione uma categoria.
    ...                 Informe o valor da diária.

    @{got_alerts}    Create List

    Go To Equipo Form
    Submit Equipo Form

    # adiciono a posição de 1 a 4 ao for
    FOR    ${position}    IN RANGE    1    5
        ${text}           Get Text For Required Alerts    ${position}
        # Joga o texto dentro da lista vazia
        Append To List    ${got_alerts}                   ${text}
    END

    Log                      ${got_alerts}
    Lists Should Be Equal    ${expect_alerts}    ${got_alerts}

     [Teardown]    Take Screenshot & Go Back    # tirar screenshot e voltar uma tela para executar o próximo teste
