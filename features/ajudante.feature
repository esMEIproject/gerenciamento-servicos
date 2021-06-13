Feature: Ajudante
    As a usuario do sistema de gerenciamento de servicos para MEI
    I want to adicionar, visualizar, atualizar e remover um Ajudante
    so that eu nao tenha que fazer isso manualmente

Scenario: Cadastrar Novo Ajudante
    Given existe um usuario com o nome 'usuario001', cpf '12345678912', funcao 'Gesseiro' e senha 'password'
    And estou logado no sistema com o cpf '12345678912' e senha 'password'
    When eu entro na pagina Ajudantes
    And clico em novo ajudante
    When eu preencho os campos de nome 'Ajudante A', cpf '12121212121', contato '123456999' e preco da mao de obra '120'
    And clico em cadastrar ajudante
    Then eu vejo que o novo ajudante com o nome 'Ajudante A' foi criado

Scenario: Apagar Ajudante
    Given existe um usuario com o nome 'usuario001', cpf '12345678912', funcao 'Gesseiro' e senha 'password'
    And estou logado no sistema com o cpf '12345678912' e senha 'password'
    When eu entro na pagina Ajudantes
    And existe um ajudante com o nome 'Ajudante A', cpf '12121212121', contato '123456999' e preco da mao de obra '120'
    When eu clico em apagar ajudante 'Ajudante A'
    Then eu vejo que o ajudante com nome 'Ajudante A' nao se encontra mais na pagina

