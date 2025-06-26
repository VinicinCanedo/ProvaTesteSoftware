*** Settings ***
Library           SeleniumLibrary


*** Test Cases ***
Valida acesso
    Abrir página da SauceDemo
    Capture Page Screenshot    Carrinho/evidencias/saucedemo.png
    
    E preencho o campo Username
    Capture Page Screenshot    Carrinho/evidencias/username_login.png

    E preencho o campo Password
    Capture Page Screenshot    Carrinho/evidencias/senha_login.png

    E acesso a plataforma
    Capture Page Screenshot    Carrinho/evidencias/acesso_plataforma.png

    E vejo os detalhes de um produto
    Capture Page Screenshot    Carrinho/evidencias/view_produtos.png

    E adiciono um produto ao carrinho
    Capture Page Screenshot    Carrinho/evidencias/add_produto.png

    E retorno a página inicial
    Capture Page Screenshot    Carrinho/evidencias/retorno_produtos.png

    E vejo os detalhes de um outro produto
    Capture Page Screenshot    Carrinho/evidencias/view_produtos2.png

    E adiciono o outro produto ao carrinho
    Capture Page Screenshot    Carrinho/evidencias/add_produto2.png

    E acesso o carrinho
    Capture Page Screenshot    Carrinho/evidencias/acesso_carrinho1.png

    E removo um produto do carrinho
    Capture Page Screenshot    Carrinho/evidencias/remove_produto.png

    E realizo o checkout
    Capture Page Screenshot    Carrinho/evidencias/checkout.png
    

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
    sleep       3s

E vejo os detalhes de um produto
    [Documentation]    Clica no link de um produto para ver os detalhes
    [Tags]    produto
    Click Link    id:item_5_title_link
    sleep       4s

E adiciono um produto ao carrinho
    [Documentation]    Adiciona um produtos ao carrinho
    [Tags]    carrinho
    Click Element    xpath=//button[contains(text(), 'ADD TO CART')]
    sleep       2s

E retorno a página inicial
    [Documentation]    Clica no botão de voltar para retornar à página inicial
    [Tags]    produto
    Click Element    xpath=//button[contains(text(), '<- Back')]
    sleep       2s

E vejo os detalhes de um outro produto
    [Documentation]    Clica no link de um produto para ver os detalhes
    [Tags]    produto
    Click Link    id:item_4_title_link
    sleep       4s

E adiciono o outro produto ao carrinho
    [Documentation]    Adiciona outro produto ao carrinho
    [Tags]    carrinho
    Click Element    xpath=//button[contains(text(), 'ADD TO CART')]
    sleep       2s

E acesso o carrinho
    [Documentation]    Clica no ícone do carrinho para acessar o carrinho de compras
    [Tags]    carrinho
    Click Element    xpath=//a[@class='shopping_cart_link fa-layers fa-fw']
    sleep       2s

E removo um produto do carrinho
    [Documentation]    Remove um produto do carrinho
    [Tags]    carrinho
    Click Element    xpath=//button[contains(text(), 'REMOVE')]
    Sleep    2s

E realizo o checkout
    [Documentation]    Clica no botão de checkout para iniciar o processo de compra
    [Tags]    checkout
    Click Element    xpath=//a[@class='btn_action checkout_button']
    sleep       5s