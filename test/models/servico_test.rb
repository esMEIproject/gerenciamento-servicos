require "test_helper"

class ServicoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "Deve salvar Servico cadastrado corretamente" do
    usuario = Usuario.new nome: 'Usuario Teste',
    cpf: '12345678912',
    funcao: 'Gesseiro',
    password: 'password1'
    
    usuario.save
    
    ajudante = Ajudante.new nome: 'Ajudante Teste',
    cpf: '12678721a',
    contato: '00000000',
    precoMaoDeObra: '400',
    usuario_id: usuario.id

    ajudante.save

    cliente = Cliente.new nome: 'Cliente Teste 1',
    cpf: '11111111111',
    contato: '45214521',
    endereco_attributes:{ cidade: 'Garanhuns',
    bairro: 'Boa Vista',
    logradouro: 'Rua Doze, numero 15',
    complemento: 'Apartamento 112'},
    usuario_id: usuario.id
  
    cliente.save


    material = Material.new nome: 'Gesso',
    descricao: '2 sacos de gesso liso',
    valor: '1000',
    usuario_id: usuario.id
    
    material.save

    servico = Servico.new cliente_id: cliente.id,
    tipoDoServico: 'Colocar forro de Gesso',
    descricao: 'Colocar forro de 5 metros na cozinha',
    ajudante_id: ajudante.id,
    material_id: material.id,
    data: '2021/10/11',
    valorDoServico: '3000',
    statusDePagamento: false,
    usuario_id: usuario.id

    assert servico.save
  end
  test "Deve salvar Servico cadastrado corretamente sem um ajudante" do
    usuario = Usuario.new nome: 'Usuario Teste',
    cpf: '12345678912',
    funcao: 'Gesseiro',
    password: 'password1'
    
    usuario.save

    cliente = Cliente.new nome: 'Cliente Teste 1',
    cpf: '11111111111',
    contato: '45214521',
    endereco_attributes:{ cidade: 'Garanhuns',
    bairro: 'Boa Vista',
    logradouro: 'Rua Doze, numero 15',
    complemento: 'Apartamento 112'},
    usuario_id: usuario.id
  
    cliente.save


    material = Material.new nome: 'Gesso',
    descricao: '2 sacos de gesso liso',
    valor: '1000',
    usuario_id: usuario.id
    
    material.save

    servico = Servico.new cliente_id: cliente.id,
    tipoDoServico: 'Colocar forro de Gesso',
    descricao: 'Colocar forro de 5 metros na cozinha',
    ajudante_id: nil,
    material_id: material.id,
    data: '2021/10/11',
    valorDoServico: '3000',
    statusDePagamento: false,
    usuario_id: usuario.id

    assert servico.save
  end
  test "Nao deve salvar Servico sem um cliente" do
    usuario = Usuario.new nome: 'Usuario Teste',
    cpf: '12345678912',
    funcao: 'Gesseiro',
    password: 'password1'
    
    usuario.save
    
    ajudante = Ajudante.new nome: 'Ajudante Teste',
    cpf: '12678721a',
    contato: '00000000',
    precoMaoDeObra: '400',
    usuario_id: usuario.id

    ajudante.save

    material = Material.new nome: 'Gesso',
    descricao: '2 sacos de gesso liso',
    valor: '1000',
    usuario_id: usuario.id
    
    material.save

    servico = Servico.new cliente_id: nil,
    tipoDoServico: 'Colocar forro de Gesso',
    descricao: 'Colocar forro de 5 metros na cozinha',
    ajudante_id: ajudante.id,
    material_id: material.id,
    data: '2021/10/11',
    valorDoServico: '3000',
    statusDePagamento: false,
    usuario_id: usuario.id

    assert_not servico.save
  end
end
