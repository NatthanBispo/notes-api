Feature: Excluir nota existente
  Para conseguir deletar uma nota existente
  Como um usuario

  Background:
    Given um usuario da aplicacao
    And com 1 nota(s) cadastrada(s)

  Scenario: Usuario fornece as informações necessarias para excluir uma nota
    Given os dados necessarios para editar essa nota
    And a nota a ser modificada
    When ele solicita a exclusão da nota
    Then a nota deve ter sido excluida

  Scenario: Usuario tenta excluir uma nota de outro usuario
    Given um usuario da aplicacao
    And com 1 nota(s) cadastrada(s)
    And a nota de outro usuario a ser modificada
    When ele solicita a exclusão da nota
    Then a nota não deve ter sido excluida