*** Settings ***
Resource    ../Resources/Base.resource

*** Test Cases ***
Usuário insere credenciais válidas
    [Documentation]    Teste de login válido
    Go to Login Page
    Login With Valid Credentials
    Page Should Contain Element    ${PRODUCTS_TITLE}
    [Teardown]    Close Browser
    