*** Settings ***
Library           SeleniumLibrary


*** Test Cases ***
Valida acesso
    Abrir página da SauceDemo
    Capture Page Screenshot    Checkout/evidencias/saucedemo.png
    
    E preencho o campo Username
    Capture Page Screenshot    Checkout/evidencias/username_login.png

    E preencho o campo Password
    Capture Page Screenshot    Checkout/evidencias/senha_login.png

    E acesso a plataforma
    Capture Page Screenshot    Checkout/evidencias/acesso_plataforma.png

    E vejo os detalhes de um produto
    Capture Page Screenshot    Checkout/evidencias/view_produtos.png

    E adiciono um produto ao carrinho
    Capture Page Screenshot    Checkout/evidencias/add_produto.png

    E acesso o carrinho
    Capture Page Screenshot    Checkout/evidencias/acesso_carrinho1.png

    E realizo o checkout
    Capture Page Screenshot    Checkout/evidencias/checkout.png

    E preencho o campo First Name
    Capture Page Screenshot    Checkout/evidencias/first_name.png

    E preencho o campo Last Name
    Capture Page Screenshot    Checkout/evidencias/last_name.png

    E preencho o campo Zip/Postal Code
    Capture Page Screenshot    Checkout/evidencias/zip_code.png

    E vejo os detalhes do checkout
    Capture Page Screenshot    Checkout/evidencias/checkout_details.png

    E finalizo a compra
    Capture Page Screenshot    Checkout/evidencias/finalizar_compra.png

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
    sleep       3s

E preencho o campo First Name
    [Documentation]    Preenche o campo de nome com um nome válido
    [Tags]    checkout
    Input Text      id:first-name       Vinicius

E preencho o campo Last Name
    [Documentation]    Preenche o campo de sobrenome com um sobrenome válido
    [Tags]    checkout
    Input Text      id:last-name       Canedo

E preencho o campo Zip/Postal Code
    [Documentation]    Preenche o campo de código postal com um código válido
    [Tags]    checkout
    Input Text      id:postal-code     12345

E vejo os detalhes do checkout
    [Documentation]    Verifica os detalhes do checkout
    [Tags]    checkout
    Click Element    xpath=//input[@value='CONTINUE']
    sleep       3s

E finalizo a compra
    [Documentation]    Clica no botão de finalizar compra
    [Tags]    checkout
    Click Element    xpath=//a[@class='btn_action cart_button']
    sleep       6s