*** Settings ***
Documentation    Arquivo principal do projeto de automação web

Library      Browser
Library      Libs/mongo.py
Library      RequestsLibrary
Library      OperatingSystem
Library      Libs/Utils.py
Library      Collections

Resource    Helpers.robot
Resource    Services.robot
Resource    Actions/LoginActions.robot
Resource    Actions/EquipoActions.robot
Resource    Actions/Components.robot


*** Keywords ***
Start Session
    # Avisar a biblioteca pra definir e abrir o navegador assistida
    New Browser    chromium    True    slowMo=0:00:00

    New Page    about:blank    #    #Abrir janela em branco
    # Set Viewport Size    1366           768    # Maximizar janela

    Go To    https://rocklov-antonio-web.herokuapp.com
    # MONITOR 1366 X 768

Tirar Print da Tela
    ${shot_name}       Nome do Print
    Take Screenshot    fullPage=True    filename=${shot_name}

Finish Session
    Tirar Print da Tela

Take Screenshot & Logout
    Tirar Print da Tela
    Do Logout

Take Screenshot & Go Back
    Tirar Print da Tela
    Go Back

Login Session
    [Arguments]    ${email}    ${senha}

    Start Session
    Login With                  ${email}    ${senha}
    User Should Be Logged In