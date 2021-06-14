Feature: Usuario
  As a Usuario do sistema de gerenciamento de servicos para MEI
  I want to  adicionar, visualizar, atualizar e remover um Usuario
  So that  eu nao tenha que fazer isso manualmente

Scenario: Cadastrar novo usuario
  Given eu estou na pagina de login
  And eu clico para cadastrar um novo usuario
  When eu preencho os campos de nome 'Fulano da Silva', cpf '12345678999', funcao 'Gesseiro' e senha 'password'
  And eu clico em cadastrar usuario
  Then eu vejo uma mensagem que usuario foi cadastrado corretamente

Scenario: Cadastrar novo usuario com campo nome vazio
  Given eu estou na pagina de login
  And eu clico para cadastrar um novo usuario
  When eu preencho os campos de nome '', cpf '12345678999', funcao 'Gesseiro' e senha 'password' 
  And eu clico em cadastrar usuario
  Then eu vejo uma mensagem de usuario invalido

Scenario: Cadastrar novo usuario com campo cpf contendo letras
  Given eu estou na pagina de login
  And eu clico para cadastrar um novo usuario
  When eu preencho os campos de nome 'usuario001', cpf 'A1334345601', funcao 'Gesseiro' e senha 'password' 
  And eu clico em cadastrar usuario
  Then eu vejo uma mensagem de usuario invalido

Scenario: Cadastrar novo usuario com campo cpf ja existente
  Given eu estou na pagina de login
  And existe um usuario com o nome 'usuario001', CPF-CNPJ '12345678999', funcao 'Gesseiro' e senha 'password'
  When eu clico para cadastrar um novo usuario
  And eu preencho os campos de nome 'usuario002', cpf '12345678999', funcao 'Gesseiro' e senha 'password'
  When eu clico em cadastrar usuario
  Then eu vejo uma mensagem de usuario invalido

Scenario: Editar Usuario com campo cpf vazio
  Given eu estou na pagina de login
  And existe um usuario com o nome 'usuario001', CPF-CNPJ '12345678999', funcao 'Gesseiro' e senha 'password'
  And eu estou logado no sistema com o CPF-CNPJ '12345678999' e senha 'password'
  And eu clico em minha conta
  And eu clico em editar
  When eu preencho o campo cpf '' e senha 'password'
  And eu clico em atualizar usuario
  Then eu vejo uma mensagem de usuario invalido