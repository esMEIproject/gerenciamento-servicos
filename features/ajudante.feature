Feature: Ajudante
    As a usuario do sistema de gerenciamento de servicos para MEI
    I want to adicionar, visualizar, atualizar e remover um Ajudante
    so that eu nao tenha que fazer isso manualmente

Scenario: Cadastrar Novo Ajudante
    Given existe um usuario com o nome 'Fulano da Silva', cpf '91352091437', funcao 'Gesseiro' e senha 'password'
    And estou logado no sistema com o cpf '91352091437' e senha 'password'
    When eu entro na pagina Ajudantes
    And clico em novo ajudante
    When eu preencho os campos de nome 'Ajudante A', cpf '37968977460', contato '123456999' e preco da mao de obra '120'
    And clico em cadastrar ajudante
    Then eu vejo que o novo ajudante com o nome 'Ajudante A' foi criado

Scenario: Cadastrar Novo Ajudante com campo nome vazio 
    Given existe um usuario com o nome 'Fulano da Silva', cpf '91352091437', funcao 'Gesseiro' e senha 'password'
    And estou logado no sistema com o cpf '91352091437' e senha 'password'
    When eu entro na pagina Ajudantes
    And clico em novo ajudante
    When eu preencho os campos de nome '', cpf '37968977460', contato '123456999' e preco da mao de obra '120'
    And clico em cadastrar ajudante
    Then eu vejo que o campo nome nao pode ser vazio

Scenario: Editar ajudante
    Given existe um usuario com o nome 'Fulano da Silva', cpf '91352091437', funcao 'Gesseiro' e senha 'password'
    And estou logado no sistema com o cpf '91352091437' e senha 'password'
    When eu entro na pagina Ajudantes
    And existe um ajudante com o nome 'Ajudante A', cpf '37968977460', contato '123456999' e preco da mao de obra '120'
    When eu clico em editar ajudante 'Ajudante A'
    And eu renomeio o campo nome para 'AJUDANTE A'
    When eu clico em atualizar ajudante
    Then eu vejo que ajudante foi atualizado com sucesso

Scenario: Apagar Ajudante
    Given existe um usuario com o nome 'Fulano da Silva', cpf '91352091437', funcao 'Gesseiro' e senha 'password'
    And estou logado no sistema com o cpf '91352091437' e senha 'password'
    When eu entro na pagina Ajudantes
    And existe um ajudante com o nome 'Ajudante A', cpf '37968977460', contato '123456999' e preco da mao de obra '120'
    When eu clico em apagar ajudante 'Ajudante A'
    Then eu vejo que o ajudante com nome 'Ajudante A' nao se encontra mais na pagina

Scenario: Cadastrar novo ajudante com cpf ja existente
    Given existe um usuario com o nome 'Fulano da Silva', cpf '91352091437', funcao 'Gesseiro' e senha 'password'
    And estou logado no sistema com o cpf '91352091437' e senha 'password'
    When eu entro na pagina Ajudantes
    And existe um ajudante com o nome 'Ajudante A', cpf '37968977460', contato '123456999' e preco da mao de obra '120'
    And clico em novo ajudante
    When eu preencho os campos de nome 'Ajudante A', cpf '37968977460', contato '123456999' e preco da mao de obra '120'
    And clico em cadastrar ajudante
    Then eu vejo que o cpf digitado ja esta em uso 