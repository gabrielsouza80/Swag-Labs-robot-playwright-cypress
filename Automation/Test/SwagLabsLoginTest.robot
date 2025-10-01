*** Settings ***
Resource    ../Resources/Base.resource
Test Setup       Go to Login Page
Test Teardown    Run Keywords    sleep    10s    AND    Close the login page 

*** Test Cases ***
Usuário insere credenciais válidas
    [Documentation]    Teste de login válido
    Login with credentials    0
    Page Should Contain Element    ${DivTitleHeader}
    
Usuário insere username Locked Out
    [Documentation]    Teste de login com usuário bloqueado
    Login with credentials    1
    Page Should Contain    Epic sadface: Sorry, this user has been locked out.

Usuário tenta logar sem preencher username ou senha
    [Documentation]    Teste de login sem preencher username ou senha
    Login without credentials
    Page Should Contain    Epic sadface: Username is required
    