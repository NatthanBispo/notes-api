Feature: Atualizar nota existente
  Para conseguir autalizar uma nota existente
  Como um usuario

  Background:
    Given um usuario da aplicacao
    And com 1 nota(s) cadastrada(s)

  Scenario: Usuario fornece todas as informações necessarias para o cadastro da nota
    Given os dados necessarios para editar essa nota
    And a nota a ser modificada
    When ele solicita a edição da nota
    Then a nota deve ter sido editada com os novos dados

  Scenario: Usuario tenta editar uma nota de outro usuario
    Given um usuario da aplicacao
    And com 1 nota(s) cadastrada(s)
    And os dados necessarios para editar essa nota
    And a nota de outro usuario a ser modificada
    When ele solicita a edição da nota
    Then a nota não deve ter sido editada com os novos dados