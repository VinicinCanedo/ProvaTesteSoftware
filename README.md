# Casos de Teste - SauceDemo

Este repositório contém testes automatizados para o site [SauceDemo](https://www.saucedemo.com/). Os testes foram desenvolvidos utilizando Robot Framework e seguem a metodologia BDD.

## Estrutura do Projeto

Os testes estão organizados nas seguintes pastas:
- `Login e Logout/`: Contém os testes de login (válido e inválido) e logout.
- `Produtos/`: Contém os testes relacionados à visualização e ordenação de produtos.
- `Carrinho/`: Contém os testes para adicionar e remover produtos do carrinho de compras.
- `Checkout/`: Contém os testes para a finalização da compra.

> **Nota sobre as Evidências:** As evidências de teste (screenshots) são geradas automaticamente durante a execução de cada cenário. Elas são salvas em uma pasta chamada `evidencias`, localizada dentro do diretório de cada respectivo teste.

## Casos de Teste

Abaixo estão os cenários de teste para cada funcionalidade.

---

### Funcionalidade: Login e Logout

#### Cenário: Login Válido e Logout
```gherkin
Dado que eu abro a página da SauceDemo
E preencho o campo Username com um usuário válido
E preencho o campo Password com uma senha válida
Quando eu acesso a plataforma
E acesso o menu de opções
Então eu clico no botão de Logout para sair
```

#### Cenário: Tentativa de Login com Usuário Bloqueado
```gherkin
Dado que eu abro a página da SauceDemo
E preencho o campo Username com um usuário bloqueado
E preencho o campo Password com uma senha
Quando eu tento acessar a plataforma
Então devo ver uma mensagem de erro informando que o usuário está bloqueado
```
*(Observação: O teste `LoginInvalido_Logout` tenta realizar o fluxo completo de logout mesmo com a falha no login. O cenário BDD acima descreve o comportamento que seria o ideal para validar a mensagem de erro.)*

---

### Funcionalidade: Produtos

#### Cenário: Visualizar e Ordenar Produtos na Loja
```gherkin
Dado que eu estou logado na plataforma SauceDemo
Quando eu vejo os detalhes de um produto
E retorno a página inicial
E ordeno os produtos por preço (menor para maior)
E ordeno os produtos por nome (A-Z)
E ordeno os produtos por preço (maior para menor)
Então a ordenação dos produtos por nome (Z-A) deve ser aplicada corretamente
```

---

### Funcionalidade: Carrinho de Compras

#### Cenário: Adicionar e Remover Itens do Carrinho
```gherkin
Dado que eu estou logado na plataforma SauceDemo
Quando eu vejo os detalhes de um produto
E adiciono o produto ao carrinho
E retorno a página inicial
E vejo os detalhes de um outro produto
E adiciono o outro produto ao carrinho
E acesso o carrinho
Então eu removo um dos produtos do carrinho
```

---

### Funcionalidade: Checkout

#### Cenário: Finalizar uma Compra com Sucesso
```gherkin
Dado que eu adicionei um produto ao carrinho
Quando eu acesso o carrinho
E realizo o checkout
E preencho o campo First Name
E preencho o campo Last Name
E preencho o campo Zip/Postal Code
E vejo os detalhes do checkout
Então eu finalizo a compra
```

---

## Como Executar os Testes

Para executar os testes, você precisa ter o Python, Robot Framework e SeleniumLibrary instalados.

1.  **Instale as dependências:**
    ```bash
    pip install robotframework robotframework-seleniumlibrary
    ```

2.  **Execute os testes:**
    Navegue até a pasta raiz do projeto (`ProvaTesteSoftware`) pelo terminal e execute os arquivos `.robot` individualmente ou todos de uma vez.

    ```bash
    # Para executar um teste específico (ex: carrinho)
    robot Carrinho/carrinho.robot

    # Para executar todos os testes do projeto
    robot .
    ```
