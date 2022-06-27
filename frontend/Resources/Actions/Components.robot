*** Settings ***
Documentation    Elementos Compartilhados entre suites


*** Keywords ***
Alert Text Should Be
    [Arguments]    ${expect_message}

    ${element}    Set Variable    css=.alert

    Wait For Elements State    ${element}    visible    5

    Get Text    css=.alert    equal    ${expect_message}