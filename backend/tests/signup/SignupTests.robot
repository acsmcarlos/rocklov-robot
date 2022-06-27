*** Settings ***
Documentation    Signup Tests

Resource    ${EXECDIR}/resources/Base.robot


*** Test Cases ***
CT001-Add New User

    ${payload}    Get Json    signup    new_user.json

    Remove User Email    ${payload['email']}

    # ${email}      FakerLibrary.Free Email
    # &{payload}    Create Dictionary
    # ...           name=Antonio Carlos
    # ...           email=${email}
    # ...           password=123456

    ${response}         POST User    ${payload}
    Status Should Be    200          ${response}


CT002-Duplicated Email

    ${payload}    Get Json      signup    duplicated.json

    #  Inserir o registro antes
    POST User     ${payload}

    # Tentativa de inserir registro para dar status 409
    ${response}         POST User    ${payload}
    Status Should Be    409          ${response}