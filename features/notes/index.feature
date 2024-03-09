Feature: Listar notas existente
  Para conseguir listas todas as notas existentes
  Como um usuario

  Background:
    Given um usuario da aplicacao
    And com 20 nota(s) cadastrada(s)

  Scenario: Usuario solicita suas notas cadastradas
    When ele solicita a listagem de suas notas
    Then é rotornada uma lista contendo todas as 20 notas
