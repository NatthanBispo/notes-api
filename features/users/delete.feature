Feature: Usuario pode deletar sua conta
  Um usuario, pode deletar sua conta, desde que esteja logado na aplicação

  Scenario: O usuario deseja deletar sua conta
    Given um usuario da aplicacao
    When ele solicita que sua conta seja deletada
    Then a conta dele é deletada
