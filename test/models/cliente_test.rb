require "test_helper"

class ClienteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "deve salvar Cliente cadastrado corretamente" do
    usuario = Usuario.new nome: 'Usuario Teste',
      cpf: '12345678912',
      funcao: 'Confeiteiro',
      password: 'password1'

      usuario.save

    cliente = Cliente.new nome: 'Cliente Teste 1',
      cpf: '11111111111',
      contato: '45214521',
      endereco_attributes:{ cidade: 'Garanhuns',
        bairro: 'Boa Vista',
        logradouro: 'Rua Doze, numero 15',
        complemento: 'Apartamento 112'}

    assert cliente.save
  end

  test "nao deve salvar Cliente cadastrado com campo contato contendo numeros" do
    usuario = Usuario.new nome: 'Usuario Teste',
      cpf: '12345678912',
      funcao: 'Confeiteiro',
      password: 'password1'

      usuario.save

    cliente = Cliente.new nome: 'Cliente Teste 1',
      cpf: '11111111111',
      contato: '4521abcd',
      endereco_attributes:{ cidade: 'Garanhuns',
        bairro: 'Boa Vista',
        logradouro: 'Rua Doze, numero 15',
        complemento: 'Apartamento 112'}
            

    assert_not cliente.save
  end
end
