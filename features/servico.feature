Feature: Servicos
  As a Usuario do sistema de gerenciamento de servicos para MEI
  I want to adicionar, atualizar, visualizar e remover um Servico
  So that eu nao tenha que fazer isso manualmente

Scenario: Cadastrar Novo Servico
  Given um usuario cadastrado com o nome 'João da Silva', cpf '83943415430', funcao 'Eletricista' e senha 'password' existe
  And eu estou no sistema com o cpf '83943415430' e senha 'password'
  And existe um cliente com o nome de 'Marcelo Santos', cpf '33823282409', contato '45121245', cidade 'Garanhuns', bairro 'Boa Vista', logradouro 'Rua Dez', complemento 'Apartamento 123'
  And existe um ajudante com o nome de 'Carlos Antonio', cpf '60081585470', contato '996325411' e preco da mao de obra '120'
  And um material existe com o nome 'Kit de Tomadas', descricao 'Tomadas brancas 220V de 3 pinos' e preco '15'
  When eu clico em novo servico
  And eu seleciono o cliente 'Marcelo Santos', tipo de servico 'Instalação de tomadas', descricao do servico 'Instalação das tomadas no quarto', seleciono o ajudante 'Carlos Antonio', o material 'Kit de Tomadas', a data '10' de 'Agosto' de '2021', valor do servico '500' e status de pagamento 'Pago'
  Then eu vejo que o servico foi criado com sucesso
  
Scenario: Cadastrar Novo Servico sem cliente
  Given um usuario cadastrado com o nome 'João da Silva', cpf '83943415430', funcao 'Eletricista' e senha 'password' existe
  And eu estou no sistema com o cpf '83943415430' e senha 'password'
  And existe um ajudante com o nome de 'Carlos Antonio', cpf '60081585470', contato '996325411' e preco da mao de obra '120'
  And um material existe com o nome 'Kit de Tomadas', descricao 'Tomadas brancas 220V de 3 pinos' e preco '15'
  When eu clico em novo servico
  And eu seleciono o cliente '', tipo de servico 'Instalação de tomadas', descricao do servico 'Instalação das tomadas no quarto', seleciono o ajudante 'Carlos Antonio', o material 'Kit de Tomadas', a data '10' de 'Agosto' de '2021', valor do servico '500' e status de pagamento 'Pago'
  Then eu vejo uma mensagem informando que cliente deve existir

Scenario: Editar Servico
  Given um usuario cadastrado com o nome 'João da Silva', cpf '83943415430', funcao 'Eletricista' e senha 'password' existe
  And eu estou no sistema com o cpf '83943415430' e senha 'password'
  And existe um cliente com o nome de 'Marcelo Santos', cpf '33823282409', contato '45121245', cidade 'Garanhuns', bairro 'Boa Vista', logradouro 'Rua Dez', complemento 'Apartamento 123'
  And existe um ajudante com o nome de 'Carlos Antonio', cpf '60081585470', contato '996325411' e preco da mao de obra '120'
  And um material existe com o nome 'Kit de Tomadas', descricao 'Tomadas brancas 220V de 3 pinos' e preco '15'
  And existe o servico com cliente 'Marcelo Santos', tipo de servico 'Instalação de tomadas', descricao do servico 'Instalação das tomadas no quarto', seleciono o ajudante 'Carlos Antonio', o material 'Kit de Tomadas', a data '10' de 'Agosto' de '2021', valor do servico '500' e status de pagamento 'Pago'
  When eu clico em editar o servico 'Instalação de tomadas' do cliente 'Marcelo Santos'
  And eu renomeio o tipo de servico para 'Instalação de tomadas tipo b'
  When eu clico em atualizar servico
  Then eu vejo que o servico foi atualizado com sucesso

Scenario: Apagar Servico
  Given um usuario cadastrado com o nome 'João da Silva', cpf '83943415430', funcao 'Eletricista' e senha 'password' existe
  And eu estou no sistema com o cpf '83943415430' e senha 'password'
  And existe um cliente com o nome de 'Marcelo Santos', cpf '33823282409', contato '45121245', cidade 'Garanhuns', bairro 'Boa Vista', logradouro 'Rua Dez', complemento 'Apartamento 123'
  And existe um ajudante com o nome de 'Carlos Antonio', cpf '60081585470', contato '996325411' e preco da mao de obra '120'
  And um material existe com o nome 'Kit de Tomadas', descricao 'Tomadas brancas 220V de 3 pinos' e preco '15'
  And existe o servico com cliente 'Marcelo Santos', tipo de servico 'Instalação de tomadas', descricao do servico 'Instalação das tomadas no quarto', seleciono o ajudante 'Carlos Antonio', o material 'Kit de Tomadas', a data '10' de 'Agosto' de '2021', valor do servico '500' e status de pagamento 'Pago'
  When eu clico em apagar o servico 'Instalação de tomadas' do cliente 'Marcelo Santos'
  Then eu vejo que o servico 'Instalação de tomadas' nao se encontra mais na pagina