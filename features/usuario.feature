Feature: Usuario
  As a Usuario do sistema de gerenciamento de servicos para MEI
  I want to  adicionar, visualizar, atualizar e remover um Usuario
  So that  eu nao tenha que fazer isso manualmente

Scenario: Cadastrar novo usuario
  Given eu estou na pagina de login
  And eu clico para cadastrar um novo usuario
  When eu preencho os campos de nome 'Fulano da Silva', CPF-CNPJ '12345678999', funcao 'Gesseiro' e senha 'password'
  And eu clico em cadastrar usuario
  Then eu vejo uma mensagem informando que 'Usuário foi criado com sucesso.'

Scenario: Cadastrar novo usuario com campo nome vazio
  Given eu estou na pagina de login
  And eu clico para cadastrar um novo usuario
  When eu preencho os campos de nome '', CPF-CNPJ '12345678999', funcao 'Gesseiro' e senha 'password' 
  And eu clico em cadastrar usuario
  Then eu vejo uma mensagem de erro informando que 'O campo Nome não pode ser vazio'
