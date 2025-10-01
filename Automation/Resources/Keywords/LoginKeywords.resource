*** Settings ***
Resource    ../Base.resource



*** Variables ***
${CredentialsJson}    ../Settings/credentials.json

*** Keywords ***
Login with credentials
    [Arguments]            ${NUser}
    ${credentials}=    Load JSON From File    ${CredentialsJson}
    ${users}=    Get From Dictionary    ${credentials}    users
    ${user_dictionary}=    Get From List    ${users}    ${NUser}    # 0 = standard_user, 1=locked_out_user, 2=problem_user, 3=performance_glitch_user

    ${username}=    Get From Dictionary    ${user_dictionary}    username
    ${password}=    Get From Dictionary    ${user_dictionary}    password

    Fill Username    ${username}
    Fill Password    ${password}
    Click Login

Login without credentials
    Fill Username    ${EMPTY}
    Fill Password    ${EMPTY} 
    Click Login