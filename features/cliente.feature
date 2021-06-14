Feature: Cliente
  As a usuario do sistema de gerenciamento de servicos para MEI
  I want to adicionar, visualizar, atualizar e remover um Cliente
  So that eu nao tenha que fazer isso manualmente

Scenario: Cadastrar novo cliente
  Given existe um usuario cadastrado com o nome 'usuario001', cpf '12345678999', funcao 'Gesseiro' e senha 'password'
  And estou logado no sistema com o login '12345678999' e senha 'password'
  When eu entro na pagina clientes
  And clico em novo cliente
  When eu preencho os campos com nome 'Fulano da Silva', cpf '00000000000', contato '952136988', cidade 'Garanhuns', bairro 'Boa Vista', logradouro 'Rua da Doze' e complemento 'Numero 123'
  And eu clico em cadastrar cliente
  Then eu vejo uma mensagem informando que o cliente foi criado com sucesso

Scenario: Cadastrar Novo Cliente com campo Nome vazio
  Given existe um usuario cadastrado com o nome 'usuario001', cpf '12345678999', funcao 'Gesseiro' e senha 'password' 
  And estou logado no sistema com o login '12345678999' e senha 'password'
  When eu entro na pagina clientes
  And clico em novo cliente
  When eu preencho os campos com nome '', cpf '00000000000', contato '952136988', cidade 'Garanhuns', bairro 'Boa Vista', logradouro 'Rua da Doze' e complemento 'Numero 123'
  And eu clico em cadastrar cliente
  Then eu vejo uma mensagem de erro informando que o nome nao pode ficar em branco

Scenario: Cadastrar Novo Cliente com cpf ja cadastrado
  Given existe um usuario cadastrado com o nome 'usuario001', cpf '12345678999', funcao 'Gesseiro' e senha 'password'
  And estou logado no sistema com o login '12345678999' e senha 'password'
  When eu entro na pagina clientes
  And existe um cliente com nome 'Cliente001', cpf '12312312345', contato '996439788', cidade 'Garanhuns', bairro 'Boa Vista', logradouro 'Rua da Doze' e complemento 'Numero 123'
  And clico em novo cliente
  When eu preencho os campos com nome 'Cliente002', cpf '12312312345', contato '992156988', cidade 'São paulo', bairro 'mooca', logradouro 'Rua nova são paulo' e complemento 'Numero 1580'
  And eu clico em cadastrar cliente
  Then eu vejo uma mensagem de erro informando que o cpf ja existe

Scenario: Editar cliente
  Given existe um usuario cadastrado com o nome 'usuario001', cpf '12345678999', funcao 'Gesseiro' e senha 'password' 
  And estou logado no sistema com o login '12345678999' e senha 'password'
  When eu entro na pagina clientes
  And existe um cliente com nome 'Cliente001', cpf '12312312345', contato '996439788', cidade 'Garanhuns', bairro 'Boa Vista', logradouro 'Rua da Doze' e complemento 'Numero 123'
  When clico em editar cliente com o nome 'Cliente001'
  And edito os dados com nome 'Cliente001 da Silva', cpf '75875875810', contato '999956842', cidade 'Recife', bairro 'Ibura', logradouro 'rua da idependencia' e complemento 'Numero 100'
  When clico em atualizar cliente
  Then eu vejo uma mensagem informando que o cliente foi atualizado

Scenario: Apagar cliente
  Given existe um usuario cadastrado com o nome 'usuario001', cpf '12345678999', funcao 'Gesseiro' e senha 'password' 
  And estou logado no sistema com o login '12345678999' e senha 'password'
  When eu entro na pagina clientes
  And existe um cliente com nome 'Cliente001', cpf '12312312345', contato '996439788', cidade 'Garanhuns', bairro 'Boa Vista', logradouro 'Rua da Doze' e complemento 'Numero 123'
  When clico em apagar cliente com o nome 'Cliente001'
  Then eu vejo uma mensagem informando que o cliente foi apagado