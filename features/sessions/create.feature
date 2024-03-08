Feature: Usuarios conseguirem acessar a plataforma
  Para manter o acesso a aplicacao segura
  Como um usuario da aplicacao eu quero acessar a plataforma por credenciais seguras

  Scenario: Usuario tenta fazer login na aplicação com credenciais validas
    Given um usuario da aplicacao
    When ele fornece as credenciais validas
    And ele clica no botão para fazer o login
    Then o usuario deve ter um token valido

  Scenario: Usuario tenta fazer login na aplicação com credenciais invalidas
    Given um usuario da aplicacao
    When ele fornece as credenciais invalidas
    And ele clica no botão para fazer o login
    Then o login não é realizado
