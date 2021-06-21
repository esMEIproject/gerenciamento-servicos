Feature: Material
  As a usuario do sistema de gerenciamento de servicos para MEI
  I want to adicionar, visualizar, atualizar e remover um Material
  So that eu nao tenha que fazer isso manualmente

Scenario: Cadastrar novo Material
  Given existe um usuario ja cadastrado no sistema com o nome 'usuario001', CPF '91352091437', funcao 'Gesseiro' e senha 'password'
  And estou entrando no sistema com o login '91352091437' e senha 'password'
  When clico em novo material
  When eu preencho os campos com materiais 'Moldura de gesso' , descricao 'Moldura de 5 metros lisa' e preco '40'
  And eu clico em cadastrar material
  Then eu vejo uma mensagem informando que o material foi criado com sucesso

Scenario: Apagar Material
  Given existe um usuario ja cadastrado no sistema com o nome 'usuario001', CPF '91352091437', funcao 'Gesseiro' e senha 'password'
  And estou entrando no sistema com o login '91352091437' e senha 'password'
  And existe um material com materiais 'Moldura de gesso' , descricao 'Moldura de 5 metros lisa' e preco '40'
  When eu entro na pagina de visualizar materiais
  And eu clico em apagar o material 'Moldura de gesso' 
  Then eu vejo que o material 'Moldura de gesso' nao se encontra mais na pagina

Scenario: Editar Material
  Given existe um usuario ja cadastrado no sistema com o nome 'usuario001', CPF '91352091437', funcao 'Gesseiro' e senha 'password'
  And estou entrando no sistema com o login '91352091437' e senha 'password'
  And existe um material com materiais 'Moldura de gesso' , descricao 'Moldura de 5 metros lisa' e preco '40'
  When eu entro na pagina de visualizar materiais
  And eu clico em editar o material 'Moldura de gesso' 
  And eu renomeio o campo preco para '50'
  When eu clico em atualizar material
  Then Eu vejo uma mensagem informando que material foi editado com sucesso
