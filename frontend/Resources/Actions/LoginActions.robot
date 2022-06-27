*** Settings ***
Documentation    Login Actions


*** Keywords ***
Login With
    [Arguments]    ${email}    ${pass}

    Fill Text    xpath=//input[@id='user_email']       ${email}
    Fill Text    xpath=//input[@id='user_password']    ${pass}
    Click        text=Entrar

User Should Be Logged In
    Wait For Elements State    css=h1    visible    5

Do Logout
    Click    css=.do-Logout