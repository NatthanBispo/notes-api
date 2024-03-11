Feature: Cadastrar nova nota
  Para conseguir cadastrar uma nova nota na listagem de notas
  Como um usuario

  Background:
    Given um usuario da aplicacao

  Scenario: Usuario fornece todas as informações necessarias para o cadastro da nota
    And os dados validos para cirar uma nova nota
    When ele solicita a criação da nova nota
    Then a nota deve ter sido criada e adicionada na listagem de notas do usuario

  Scenario: Usuario esquece de fornecer um atributo na hora de criar uma nota
    And os dados invalidos para cirar uma nova nota
    When ele solicita a criação da nova nota
    Then a nota não deve ser criada e uma mensagem de erro é informada