*** Settings ***
Library           SeleniumLibrary


*** Test Cases ***
Valida acesso
    Abrir página da SauceDemo
    Capture Page Screenshot    Login e Logout/LoginValido_Logout/evidencias/saucedemo.png
    
    E preencho o campo Username
    Capture Page Screenshot    Login e Logout/LoginValido_Logout/evidencias/username_login.png

    E preencho o campo Password
    Capture Page Screenshot    Login e Logout/LoginValido_Logout/evidencias/senha_login.png

    E acesso a plataforma
    Capture Page Screenshot    Login e Logout/LoginValido_Logout/evidencias/acesso_plataforma.png
    
    E acesso o menu de opções
    Capture Page Screenshot    Login e Logout/LoginValido_Logout/evidencias/menu_opcoes.png

    E clico no botão de Logout
    Capture Page Screenshot    Login e Logout/LoginValido_Logout/evidencias/click_logout.png

    Close Browser    

*** Keywords ***
Abrir página da SauceDemo
    [Documentation]    Abre a página de login do SauceDemo em modo incógnito
    [Tags]    login
    Open Browser       https://www.saucedemo.com/v1/       chrome    options=add_argument("--incognito")
    Maximize Browser Window
    Sleep   1s
    
E preencho o campo Username
    [Documentation]    Preenche o campo de usuário com um usuário válido
    [Tags]    login
    Input Text      id:user-name       standard_user
E preencho o campo Password
    [Documentation]    Preenche o campo de password com uma senha válida
    [Tags]    login
    Input Text      id:password       secret_sauce

E acesso a plataforma
    [Documentation]    Clica no botão de login para acessar a plataforma
    [Tags]    login
    Click Button    id:login-button
    sleep       6s

E acesso o menu de opções
    [Documentation]    Clica no menu de opções do usuário
    [Tags]    logout
    Click Element    xpath=//button[contains(text(), 'Open Menu')]
    sleep       2s

E clico no botão de Logout
    [Documentation]    Clica no botão de logout para sair da plataforma
    [Tags]    logout
    Click Element    xpath=//a[contains(text(), 'Logout')]
    sleep       2s