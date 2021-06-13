Feature: Cliente
  As a usuario do sistema de gerenciamento de servicos para MEI
  I want to adicionar, visualizar, atualizar e remover um Cliente
  So that eu nao tenha que fazer isso manualmente

Scenario: Cadastrar novo cliente
  Given existe um usuario com o nome 'usuario001', CPF-CNPJ '12345678999', funcao 'Gesseiro' e senha 'password'
  And estou logado no sistema com o login '12345678999' e senha 'password'
  When eu entro na pagina clientes
  And clico em novo cliente
  When eu preencho os campos com nome 'Fulano da Silva', CPF '00000000000', contato '952136988', cidade 'Garanhuns', bairro 'Boa Vista', logradouro 'Rua da Doze' e complemento 'Numero 123'
  And eu clico em cadastrar cliente
  Then eu vejo uma mensagem informando que o cliente foi criado com sucesso

Scenario: Cadastrar Novo Cliente com campo Nome vazio
  Given existe um usuario com o nome 'usuario001', CPF-CNPJ '12345678999', funcao 'Gesseiro' e senha 'password' 
  And estou logado no sistema com o login '12345678999' e senha 'password'
  When eu entro na pagina clientes
  And clico em novo cliente
  When eu preencho os campos com nome '', CPF '00000000000', contato '952136988', cidade 'Garanhuns', bairro 'Boa Vista', logradouro 'Rua da Doze' e complemento 'Numero 123'
  And eu clico em cadastrar cliente
  Then eu vejo uma mensagem de erro informando que o nome nao pode ficar em branco