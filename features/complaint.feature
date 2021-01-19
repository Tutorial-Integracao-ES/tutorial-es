Feature: Complaint 
  As usuario do sistema
  I want to adicionar, mostrar, atualizar e remover reclamacoes
  So that Eu possa realizar reclamacoes no sistema de forma simples

  Scenario: nova reclamacao
    Given Eu estou logado
    And Eu estou na pagina de criacao de reclamacao
    When Eu preencho o campo de titulo, o campo de conteudo, o campo de categoria e o campo de selecao de empresa, respectivamente, com 'Reclamacao', 'Teste de reclamacao.', 'Eletrodomesticos' e 'Empresa2'
    And Eu clico em criar reclamacao 
    Then Eu vejo que a reclamacao com titulo 'Reclamacao' foi criada

  Scenario: remover reclamacao
    Given Eu estou logado
    And A reclamacao de titulo, conteudo, categoria e empresa, respectivamente preenchidos com, 'Reclamacao', 'Teste de reclamacao.', 'Eletrodomesticos' e 'Empresa2' existe
    And Eu estou na pagina de detalhes da reclamacao com titulo 'Reclamacao'
    When Eu clico em remover reclamacao
    Then Eu vejo que a reclamacao com titulo 'Reclamacao' foi corretamente deletada

  Scenario: criar reclamacao invalida
    Given Eu estou logado
    And Eu estou na pagina de criacao de reclamacao
    When Eu preencho o campo de titulo, o campo de conteudo, o campo de categoria e o campo de selecao de empresa, respectivamente, com '', 'curto', 'Eletrodomesticos' e 'Empresa2'
    And Eu clico em criar reclamacao 
    Then Eu vejo uma mensagem de erro na criacao da reclamacao

  Scenario: criar reclamacao sem estar logado
    Given Eu estou na pagina de listagem de reclamacoes
    When Eu acesso a pagina de criar reclamacao
    Then Eu vejo que nao tenho permissao para entrar naquela routa sendo redirecionado para a pagina de listagem novamente