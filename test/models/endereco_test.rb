require "test_helper"

class EnderecoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "Deve salvar um endereco cadastrado corretamente" do
    usuario = Usuario.new nome: 'Usuario Teste',
    cpf: '39775387485',
    funcao: 'Gesseiro',
    password: 'password1'
    
    usuario.save

    cliente = Cliente.new nome: 'Cliente Teste',
    cpf: '37287511460',
    contato: '45214521',
    endereco_attributes:{ cidade: 'Garanhuns',
    bairro: 'Boa Vista',
    logradouro: 'Rua Doze, numero 15',
    complemento: 'Apartamento 112'},
    usuario_id: usuario.id
  
    assert cliente.save
  end

  test "Nao deve salvar um endereco com bairro menor que 5 caracteres" do
    usuario = Usuario.new nome: 'Usuario Teste',
    cpf: '39775387485',
    funcao: 'Gesseiro',
    password: 'password1'
    
    usuario.save

    cliente = Cliente.new nome: 'Cliente Teste',
    cpf: '37287511460',
    contato: '45214521',
    endereco_attributes:{ cidade: 'Garanhuns',
    bairro: 'Boa',
    logradouro: 'Rua Doze, numero 15',
    complemento: 'Apartamento 112'},
    usuario_id: usuario.id
  
    assert_not cliente.save
  end

  test "Nao deve salvar um endereco sem um complemento" do
    usuario = Usuario.new nome: 'Usuario Teste',
    cpf: '39775387485',
    funcao: 'Gesseiro',
    password: 'password1'
    
    usuario.save

    cliente = Cliente.new nome: 'Cliente Teste',
    cpf: '37287511460',
    contato: '45214521',
    endereco_attributes:{ cidade: 'Ga',
    bairro: 'Boa Vista',
    logradouro: 'Rua Doze, numero 15'},
    usuario_id: usuario.id
  
    assert_not cliente.save
  end
  test "Nao deve salvar um endereco com cidade menor que 3 caracteres" do
    usuario = Usuario.new nome: 'Usuario Teste',
    cpf: '39775387485',
    funcao: 'Gesseiro',
    password: 'password1'
    
    usuario.save

    cliente = Cliente.new nome: 'Cliente Teste',
    cpf: '37287511460',
    contato: '45214521',
    endereco_attributes:{ cidade: 'Ga',
    bairro: 'Boa Vista',
    logradouro: 'Rua Doze, numero 15',
    complemento: 'Apartamento 112'},
    usuario_id: usuario.id
  
    assert_not cliente.save
  end
  test "Nao deve salvar um endereco com logradouro menor que 5 caracteres" do
    usuario = Usuario.new nome: 'Usuario Teste',
    cpf: '39775387485',
    funcao: 'Gesseiro',
    password: 'password1'
    
    usuario.save

    cliente = Cliente.new nome: 'Cliente Teste',
    cpf: '37287511460',
    contato: '45214521',
    endereco_attributes:{ cidade: 'Garanhuns',
    bairro: 'Boa Vista',
    logradouro: 'Rua',
    complemento: 'Apartamento 112'},
    usuario_id: usuario.id
  
    assert_not cliente.save
  end
  test "Nao deve salvar um endereco sem cidade" do
    usuario = Usuario.new nome: 'Usuario Teste',
    cpf: '39775387485',
    funcao: 'Gesseiro',
    password: 'password1'
    
    usuario.save

    cliente = Cliente.new nome: 'Cliente Teste',
    cpf: '37287511460',
    contato: '45214521',
    endereco_attributes:{bairro: 'Boa Vista',
    logradouro: 'Rua Doze, numero 15',
    complemento: 'Apartamento 112'},
    usuario_id: usuario.id
  
    assert_not cliente.save
  end
end
