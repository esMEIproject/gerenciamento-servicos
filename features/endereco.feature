Feature: Endereco
  As a usuario do sistema de gerenciamento de servicos para MEI
  I want to adicionar, visualizar, atualizar e remover um Endereco
  so that eu nao tenha que fazer isso manualmente

Scenario: Cadastrar Novo endereco
  Given um usuario no sistema com nome 'Paulo Silva', cpf '83943415430', funcao 'Eletricista' e senha 'password' existe
  And estou logado como usuario com cpf '83943415430' e senha 'password'
  When eu entro na pagina de clientes
  And clico para cadastrar novo cliente
  When eu preencho nome 'Marcelo Souza', cpf '33823282409', contato '125698452'
  And os campos de endereco Cidade 'Garanhuns', Bairro 'Boa Vista', Logradouro 'Rua Benito' e Complemento 'Numero 123'
  When eu clico para cadastrar cliente
  Then eu vejo uma mensagem que cliente foi criado com sucesso

Scenario: Cadastrar Novo endereco com campo cidade vazio
  Given um usuario no sistema com nome 'Paulo Silva', cpf '83943415430', funcao 'Eletricista' e senha 'password' existe
  And estou logado como usuario com cpf '83943415430' e senha 'password'
  When eu entro na pagina de clientes
  And clico para cadastrar novo cliente
  When eu preencho nome 'Marcelo Souza', cpf '33823282409', contato '125698452'
  And os campos de endereco Cidade '', Bairro 'Boa Vista', Logradouro 'Rua Benito' e Complemento 'Numero 123'
  When eu clico para cadastrar cliente
  Then eu vejo uma mensagem informando que cidade nao pode ser em branco

Scenario: Cadastrar Novo endereco com campo bairro menor do que o tamanho exigido
  Given um usuario no sistema com nome 'Paulo Silva', cpf '83943415430', funcao 'Eletricista' e senha 'password' existe
  And estou logado como usuario com cpf '83943415430' e senha 'password'
  When eu entro na pagina de clientes
  And clico para cadastrar novo cliente
  When eu preencho nome 'Marcelo Souza', cpf '33823282409', contato '125698452'
  And os campos de endereco Cidade 'Garanhuns', Bairro 'Boa', Logradouro 'Rua Benito' e Complemento 'Numero 123'
  When eu clico para cadastrar cliente
  Then eu vejo uma mensagem informando que campo bairro e muito curto

Scenario: Editar endereco
  Given um usuario no sistema com nome 'Paulo Silva', cpf '83943415430', funcao 'Eletricista' e senha 'password' existe
  And estou logado como usuario com cpf '83943415430' e senha 'password'
  When eu entro na pagina de clientes
  And existe um cliente cadastrado como nome 'Marcelo Souza', cpf '33823282409', contato '125698452', cidade 'Garanhuns', bairro 'Boa Vista', logradouro 'Rua Benito' e complemento 'Numero 123'
  When eu clico em editar o cliente 'Marcelo Souza'
  And renomeio o campo de complemento para 'Apartamento 123, 10º andar'
  When eu clico em atualizar cliente
  Then eu vejo uma mensagem que cliente foi atualizado corretamente

Scenario: Cadastrar Novo endereco com cidade maior do que o tamanho exigido
  Given um usuario no sistema com nome 'Paulo Silva', cpf '83943415430', funcao 'Eletricista' e senha 'password' existe
  And estou logado como usuario com cpf '83943415430' e senha 'password'
  When eu entro na pagina de clientes
  And clico para cadastrar novo cliente
  When eu preencho nome 'Marcelo Souza', cpf '33823282409', contato '125698452'
  And os campos de endereco Cidade 'ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789101112131415', Bairro 'Boa Vista', Logradouro 'Rua Benito' e Complemento 'Numero 123'
  When eu clico para cadastrar cliente
  Then eu vejo uma mensagem que informando que campo cidade e muito longo
