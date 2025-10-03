*** Settings ***
Resource    ../../Base.resource

*** Variables ***
${CredentialsJson}    ../Settings/credentials.json

*** Keywords ***

Login with credentials
    [Arguments]    ${NUser}
    ${credentials}=    Load JSON From File    ${CredentialsJson}
    ${users}=          Get From Dictionary    ${credentials}    users
    ${user_dictionary}=    Get From List    ${users}    ${NUser}    #0=standard_user, 1=locked_out_user, 2=problem_user, 3=performance_glitch_user
    ${username}=           Get From Dictionary    ${user_dictionary}    username
    ${password}=           Get From Dictionary    ${user_dictionary}    password
    [Return]    ${username}    ${password}

    Input Text    ${LOGIN_USERNAME_FIELD}    ${username}
    Input Text    ${LOGIN_PASSWORD_FIELD}    ${password}
    Click Button    ${LOGIN_BUTTON}

Verificar que foi para pagina esperada            
    [Arguments]    ${LocatorPageExpected}
    Page Should Contain Element    ${LocatorPageExpected}

Verificar Mensagem de erro
    [Arguments]    ${mensagem_esperada}
    Page Should Contain    ${mensagem_esperada}    

Login without credentials
    Input Text    ${LOGIN_USERNAME_FIELD}    ${EMPTY}
    Input Text    ${LOGIN_USERNAME_FIELD}    ${EMPTY} 
    Click Button    ${LOGIN_BUTTON}









Fill Password
    [Arguments]    ${password}
    Input Text    ${LOGIN_PASSWORD_FIELD}    ${password}

Click Login
    Click Button    ${LOGIN_BUTTON}



    