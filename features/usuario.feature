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
  Then eu vejo uma mensagem de erro informando que "Nome can't be blank"

Scenario: Cadastrar novo usuario com campo CPF invalido
  Given eu estou na pagina de login
  And eu clico para cadastrar um novo usuario
  When eu preencho os campos de nome 'usuario001', CPF-CNPJ 'A1334345601', funcao 'Gesseiro' e senha 'password' 
  And eu clico em cadastrar usuario
  Then eu vejo uma mensagem de erro informando que 'Cpf is not a number'

Scenario: Cadastrar novo usuario com campo CPF-CNPJ ja existente
  Given eu estou na pagina de login
  And existe um usuario cadastrado com o nome 'usuario001', CPF-CNPJ '12345678999', funcao 'Gesseiro' e senha 'password'
  When eu clico para cadastrar um novo usuario
  And eu preencho os campos de nome 'usuario002', CPF-CNPJ '12345678999', funcao 'Gesseiro' e senha 'password'
  When eu clico em cadastrar usuario
  Then eu vejo uma mensagem de erro informando que 'Cpf has already been taken'

Scenario: Editar Usuario com campo CPF-CNPJ vazio
  Given eu estou na pagina de login
  And existe um usuario cadastrado com o nome 'usuario001', CPF-CNPJ '12345678999', funcao 'Gesseiro' e senha 'password'
  And eu estou logado no sistema com o CPF-CNPJ '12345678999' e senha 'password'
  And eu clico em minha conta
  And eu clico em editar
  When eu preencho o campo CPF-CNPJ ''
  And eu clico e atualizar usuario
  Then eu vejo uma mensagem de erro informando que 'Cpf is the wrong length (should be 11 characters)'