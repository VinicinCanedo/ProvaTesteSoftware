*** Settings ***
Library           SeleniumLibrary


*** Test Cases ***
Valida acesso
    Abrir página da SauceDemo
    Capture Page Screenshot    Produtos/evidencias/saucedemo.png
    
    E preencho o campo Username
    Capture Page Screenshot    Produtos/evidencias/username_login.png

    E preencho o campo Password
    Capture Page Screenshot    Produtos/evidencias/senha_login.png

    E acesso a plataforma
    Capture Page Screenshot    Produtos/evidencias/acesso_plataforma.png
    
    E vejo os detalhes de um produto
    Capture Page Screenshot    Produtos/evidencias/view_produtos.png

    E retorno a página inicial
    Capture Page Screenshot    Produtos/evidencias/retorno_produtos.png

    E ordeno os produtos por preço (menor para maior)
    Capture Page Screenshot    Produtos/evidencias/ordenar_produtos1.png

    E ordeno os produtos por nome (A-Z)
    Capture Page Screenshot    Produtos/evidencias/ordenar_produtos2.png

    E ordeno os produtos por preço (maior para menor)
    Capture Page Screenshot    Produtos/evidencias/ordenar_produtos3.png

    E ordeno os produtos por nome (Z-A)    
    Capture Page Screenshot    Produtos/evidencias/ordenar_produtos4.png

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

E retorno a página inicial
    [Documentation]    Clica no botão de voltar para retornar à página inicial
    [Tags]    produto
    Click Element    xpath=//button[contains(text(), '<- Back')]
    sleep       2s

E ordeno os produtos por preço (menor para maior)
    [Documentation]    Seleciona a opção de ordenar os produtos por preço
    [Tags]    produto
    Click Element   xpath=//select[@class='product_sort_container']
    Click Element    xpath=//option[@value='lohi']
    sleep       3s

E ordeno os produtos por nome (A-Z)
    [Documentation]    Seleciona a opção de ordenar os produtos por preço
    [Tags]    produto
    Click Element   xpath=//select[@class='product_sort_container']
    Click Element    xpath=//option[@value='az']
    sleep       3s

E ordeno os produtos por preço (maior para menor)
    [Documentation]    Seleciona a opção de ordenar os produtos por preço
    [Tags]    produto
    Click Element   xpath=//select[@class='product_sort_container']
    Click Element    xpath=//option[@value='hilo']
    sleep       3s

E ordeno os produtos por nome (Z-A)
    [Documentation]    Seleciona a opção de ordenar os produtos por preço
    [Tags]    produto
    Click Element   xpath=//select[@class='product_sort_container']
    Click Element    xpath=//option[@value='za']
    sleep       3s