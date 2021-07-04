require "test_helper"

class ServicoTest < ActiveSupport::TestCase
 
  test "Deve salvar Servico cadastrado corretamente" do
    usuario = Usuario.new nome: 'Usuario Teste',
    cpf: '78015906008',
    funcao: 'Gesseiro',
    password: 'password1'
    
    assert usuario.save
    
    ajudante = Ajudante.new nome: 'Ajudante Teste',
    cpf: '88217414009',
    contato: '123654789',
    precoMaoDeObra: '400',
    usuario_id: usuario.id

    assert ajudante.save

    cliente = Cliente.new nome: 'Cliente Teste',
    cpf: '62577993099',
    contato: '45214521',
    endereco_attributes:{ cidade: 'Garanhuns',
    bairro: 'Boa Vista',
    logradouro: 'Rua Doze, numero 15',
    complemento: 'Apartamento 112'},
    usuario_id: usuario.id
  
    assert cliente.save

    material = Material.new nome: 'Gesso',
    descricao: '2 sacos de gesso liso',
    valor: '1000',
    usuario_id: usuario.id
    
    assert material.save

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
    cpf: '78015906008',
    funcao: 'Gesseiro',
    password: 'password1'
    
    assert usuario.save

    cliente = Cliente.new nome: 'Cliente Teste',
    cpf: '62577993099',
    contato: '45214521',
    endereco_attributes:{ cidade: 'Garanhuns',
    bairro: 'Boa Vista',
    logradouro: 'Rua Doze, numero 15',
    complemento: 'Apartamento 112'},
    usuario_id: usuario.id
  
    assert cliente.save

    material = Material.new nome: 'Gesso',
    descricao: '2 sacos de gesso liso',
    valor: '1000',
    usuario_id: usuario.id
    
    assert material.save

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
    cpf: '78015906008',
    funcao: 'Gesseiro',
    password: 'password1'
    
    assert usuario.save
    
    ajudante = Ajudante.new nome: 'Ajudante Teste',
    cpf: '88217414009',
    contato: '12365478',
    precoMaoDeObra: '400',
    usuario_id: usuario.id

    assert ajudante.save

    material = Material.new nome: 'Gesso',
    descricao: '2 sacos de gesso liso',
    valor: '1000',
    usuario_id: usuario.id
    
    assert material.save

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

  #--------------------3 iteracao -------------------------------------------

  test "Deve salvar Servico cadastrado corretamente sem material" do
    usuario = Usuario.new nome: 'Usuario Teste',
    cpf: '78015906008',
    funcao: 'Gesseiro',
    password: 'password1'
    
    assert usuario.save

    cliente = Cliente.new nome: 'Cliente Teste',
    cpf: '62577993099',
    contato: '45214521',
    endereco_attributes:{ cidade: 'Garanhuns',
    bairro: 'Boa Vista',
    logradouro: 'Rua Doze, numero 15',
    complemento: 'Apartamento 112'},
    usuario_id: usuario.id
  
    assert cliente.save
    
    ajudante = Ajudante.new nome: 'Ajudante Teste',
    cpf: '88217414009',
    contato: '12365478',
    precoMaoDeObra: '400',
    usuario_id: usuario.id

    assert ajudante.save

    servico = Servico.new cliente_id: cliente.id,
    tipoDoServico: 'Colocar forro de Gesso',
    descricao: 'Colocar forro de 5 metros na cozinha',
    ajudante_id: ajudante.id,
    material_id: nil,
    data: '2021/10/11',
    valorDoServico: '3000',
    statusDePagamento: false,
    usuario_id: usuario.id

    assert servico.save
  end

  test "Nao deve salvar Servico com a data menor que a data atual" do
    usuario = Usuario.new nome: 'Usuario Teste',
    cpf: '78015906008',
    funcao: 'Gesseiro',
    password: 'password1'
    
    assert usuario.save

    cliente = Cliente.new nome: 'Cliente Teste',
    cpf: '62577993099',
    contato: '45214521',
    endereco_attributes:{ cidade: 'Garanhuns',
    bairro: 'Boa Vista',
    logradouro: 'Rua Doze, numero 15',
    complemento: 'Apartamento 112'},
    usuario_id: usuario.id
  
    assert cliente.save
    
    ajudante = Ajudante.new nome: 'Ajudante Teste',
    cpf: '88217414009',
    contato: '12365478',
    precoMaoDeObra: '400',
    usuario_id: usuario.id

    assert ajudante.save

    servico = Servico.new cliente_id: cliente.id,
    tipoDoServico: 'Colocar forro de Gesso',
    descricao: 'Colocar forro de 5 metros na cozinha',
    ajudante_id: ajudante.id,
    material_id: nil,
    data: '2021/01/01',
    valorDoServico: '3000',
    statusDePagamento: false,
    usuario_id: usuario.id

    assert_not servico.save
  end

  test "Nao deve salvar Servico com valor do servico vazio" do
    usuario = Usuario.new nome: 'Usuario Teste',
    cpf: '78015906008',
    funcao: 'Gesseiro',
    password: 'password1'
    
    assert usuario.save
    
    ajudante = Ajudante.new nome: 'Ajudante Teste',
    cpf: '88217414009',
    contato: '123654789',
    precoMaoDeObra: '400',
    usuario_id: usuario.id

    assert ajudante.save

    cliente = Cliente.new nome: 'Cliente Teste',
    cpf: '62577993099',
    contato: '45214521',
    endereco_attributes:{ cidade: 'Garanhuns',
    bairro: 'Boa Vista',
    logradouro: 'Rua Doze, numero 15',
    complemento: 'Apartamento 112'},
    usuario_id: usuario.id
  
    assert cliente.save

    material = Material.new nome: 'Gesso',
    descricao: '2 sacos de gesso liso',
    valor: '1000',
    usuario_id: usuario.id
    
    assert material.save

    servico = Servico.new cliente_id: cliente.id,
    tipoDoServico: 'Colocar forro de Gesso',
    descricao: 'Colocar forro de 5 metros na cozinha',
    ajudante_id: ajudante.id,
    material_id: material.id,
    data: '2021/10/11',
    valorDoServico: '',
    statusDePagamento: false,
    usuario_id: usuario.id

    assert_not servico.save
  end
end
