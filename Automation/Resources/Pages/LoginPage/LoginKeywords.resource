*** Settings ***
Resource    ../../Base.resource

*** Variables ***
${CredentialsJson}    ../Settings/credentials.json

*** Keywords ***
Login with credentials
    [Arguments]    ${role}

    # Carrega o arquivo JSON contendo as credenciais (variável ${CredentialsJson} deve conter o caminho do arquivo)
    ${credentials}=    Load JSON From File    ${CredentialsJson}

    # Pega a lista "users" do JSON
    ${users}=    Get From Dictionary    ${credentials}    users
    
    #variavel para armazenar o dicionário do usuário encontrado
    ${user_dictionary}=    Set Variable    ${None}
    
    # Percorre a lista de usuários procurando aquele cujo campo "role" corresponde ao argumento ${role}
    FOR    ${i}    IN    @{users}                                                                               # Inicia um loop, onde ${i} representa cada usuário (dicionário) da lista @{users}
        ${user_role}=    Get From Dictionary    ${i}    role                                                    # Pega o valor da chave "role" dentro do dicionário atual (${i}) e armazena em ${user_role}
        Run Keyword If    '${user_role}' == '${role}'    Set Test Variable    ${user_dictionary}    ${i}        # Se o "role" do usuário atual for igual ao argumento passado (${role}), guarda esse dicionário em ${user_dictionary}
        Exit For Loop If    ${user_dictionary}                                                                  # Sai imediatamente do loop se ${user_dictionary} já estiver definido (ou seja, usuário encontrado)
    END                                                                                                         # Marca o fim do loop FOR

    # Se não encontrou nenhum usuário com o role informado, falha o teste com mensagem clara
    Run Keyword Unless    ${user_dictionary}    Fail    No user found with role "${role}"                       # Se ${user_dictionary} estiver vazio (nenhum usuário encontrado), falha o teste com uma mensagem explicativa


    # Extrai username e password do dicionário encontrado
    ${username}=    Get From Dictionary    ${user_dictionary}    username
    ${password}=    Get From Dictionary    ${user_dictionary}    password

    # Preenche os campos de login e submete
    Input Text    ${LOGIN_USERNAME_FIELD}    ${username}
    Input Text    ${LOGIN_PASSWORD_FIELD}    ${password}
    Click Button    ${LOGIN_BUTTON}
    Sleep    5s

Check if you went to the expected page            
    [Arguments]    ${LocatorPageExpected}
    Page Should Contain Element    ${LocatorPageExpected}

Check Message
    [Arguments]    ${mensagem_esperada}
    Page Should Contain    ${mensagem_esperada}    

Login with invalid credentials
    [Arguments]    ${username}    ${password}
    Input Text    ${LOGIN_USERNAME_FIELD}    ${username}
    Input Text    ${LOGIN_PASSWORD_FIELD}    ${password}
    Click Button    ${LOGIN_BUTTON}


Username and password with 255 characters
    [Documentation]    Gera username e password com 255 caracteres
    [Tags]    TC11
    ${long_username}=    Evaluate    'a'*255
    ${long_password}=    Evaluate    'b'*255
    [Return]    ${long_username}    ${long_password}

Click Login
    Click Button    ${LOGIN_BUTTON}



    