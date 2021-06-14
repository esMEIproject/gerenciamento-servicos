require "test_helper"

class EnderecoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "Deve salvar um endereco cadastrado corretamente" do
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
  
    assert cliente.save
  end

  test "Nao deve salvar um endereco com bairro menor que 5 caracteres" do
    usuario = Usuario.new nome: 'Usuario Teste',
    cpf: '12345678912',
    funcao: 'Gesseiro',
    password: 'password1'
    
    usuario.save

    cliente = Cliente.new nome: 'Cliente Teste 1',
    cpf: '11111111111',
    contato: '45214521',
    endereco_attributes:{ cidade: 'Garanhuns',
    bairro: 'Boa',
    logradouro: 'Rua Doze, numero 15',
    complemento: 'Apartamento 112'},
    usuario_id: usuario.id
  
    assert_not cliente.save
  end

  test "Nao deve salvar um endereco com cidade menor que 3 caracteres" do
    usuario = Usuario.new nome: 'Usuario Teste',
    cpf: '12345678912',
    funcao: 'Gesseiro',
    password: 'password1'
    
    usuario.save

    cliente = Cliente.new nome: 'Cliente Teste 1',
    cpf: '11111111111',
    contato: '45214521',
    endereco_attributes:{ cidade: 'Ga',
    bairro: 'Boa Vista',
    logradouro: 'Rua Doze, numero 15',
    complemento: 'Apartamento 112'},
    usuario_id: usuario.id
  
    assert_not cliente.save
  end

end
