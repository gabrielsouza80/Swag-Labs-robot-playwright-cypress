*** Settings ***
Resource    ../../Base.resource

*** Keywords ***
Click on "Logout"
    Click Element    ${BtnOpenMenu}
    Sleep    2s
    Click Element    ${ABtnLogout}
    