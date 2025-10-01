*** Settings ***
Resource    ../Base.resource



*** Variables ***
${CredentialsJson}    ../Settings/credentials.json

*** Keywords ***
Login With Valid Credentials
    ${credentials}=    Load JSON From File    ${CredentialsJson}
    ${users}=    Get From Dictionary    ${credentials}    users
    ${user_dictionary}=    Get From List    ${users}    0   # 0 = standard_user

    ${username}=    Get From Dictionary    ${user_dictionary}    username
    ${password}=    Get From Dictionary    ${user_dictionary}    password

    Fill Username    ${username}
    Fill Password    ${password}
    Click Login