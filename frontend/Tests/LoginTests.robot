*** Settings ***
Documentation    Login Test

Resource    ../Resources/Base.robot

Suite Setup      Start Session
Test Teardown    Finish Session


*** Test Cases ***
CT01-Login Success
    [Tags]    inc_pass

    Login With    rogers@shield.com    123456

    User Should Be Logged In
    [Teardown]    Take Screenshot & Logout
    
CT02-Incorrect Password
    [Tags]    inc_pass
    
    Login With    rogers@shield.com    123457

    Alert Text Should Be    Usuário e/ou senha inválidos.

CT03-Incorrect Email
    [Tags]    inc_pass

    Login With    rogers&shield.com    123457

    Alert Text Should Be    Oops. Informe um email válido!

CT04-User Not Found
    [Tags]    inc_pass

    Login With    rogers2@shield.com    123457

    Alert Text Should Be    Usuário e/ou senha inválidos.

CT05-Empty Email
    [Tags]    inc_pass

    Login With    ${EMPTY}    123457

    Alert Text Should Be    Oops. Informe um email válido!

CT06-Empty Password
    [Tags]    inc_pass

    Login With    rogers@shield.com    ${EMPTY} 

    Alert Text Should Be    Oops. Informe sua senha secreta!

CT07-Empty Fields
    [Tags]    inc_pass

    Login With    ${EMPTY}    ${EMPTY}

    Alert Text Should Be    Oops. Informe um email válido!

    