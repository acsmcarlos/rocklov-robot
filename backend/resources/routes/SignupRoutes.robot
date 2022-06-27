*** Settings ***
Documentation    Impleementação da Rota / Signup


*** Keywords ***
POST User
    [Arguments]    ${payload}

    ${response}    POST                    
    ...            ${base_url}/signup    
    ...            json=${payload}
    ...            expected_status=any

    [Return]    ${response}