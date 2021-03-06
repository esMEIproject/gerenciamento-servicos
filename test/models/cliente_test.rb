require "test_helper"

class ClienteTest < ActiveSupport::TestCase


  test "deve salvar Cliente cadastrado corretamente" do
    usuario = Usuario.new nome: 'Usuario Teste',
      cpf: '39775387485',
      funcao: 'Confeiteiro',
      password: 'password1'

      assert usuario.save

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

  test "nao deve salvar Cliente cadastrado com campo contato contendo letras" do
    usuario = Usuario.new nome: 'Usuario Teste',
      cpf: '39775387485',
      funcao: 'Confeiteiro',
      password: 'password1'

      assert usuario.save

    cliente = Cliente.new nome: 'Cliente Teste',
      cpf: '37287511460',
      contato: '4521abcd',
      endereco_attributes:{ cidade: 'Garanhuns',
        bairro: 'Boa Vista',
        logradouro: 'Rua Doze, numero 15',
        complemento: 'Apartamento 112'},
      usuario_id: usuario.id           

    assert_not cliente.save
  end

  test "nao deve salvar Cliente cadastrado com campo cpf contendo numeros a mais" do
    usuario = Usuario.new nome: 'Usuario Teste',
      cpf: '39775387485',
      funcao: 'Confeiteiro',
      password: 'password1'

      assert usuario.save

    cliente = Cliente.new nome: 'Cliente Teste',
      cpf: '372875114603',
      contato: '45214521',
      endereco_attributes:{ cidade: 'Garanhuns',
        bairro: 'Boa Vista',
        logradouro: 'Rua Doze, numero 15',
        complemento: 'Apartamento 112'},
      usuario_id: usuario.id

    assert_not cliente.save
  end
  test "nao deve salvar Cliente cadastrado com campo cpf inválido" do
    usuario = Usuario.new nome: 'Usuario Teste',
      cpf: '39775387485',
      funcao: 'Confeiteiro',
      password: 'password1'

      assert usuario.save

    cliente = Cliente.new nome: 'Cliente Teste',
      cpf: '12345678900',
      contato: '45214521',
      endereco_attributes:{ cidade: 'Garanhuns',
        bairro: 'Boa Vista',
        logradouro: 'Rua Doze, numero 15',
        complemento: 'Apartamento 112'},
      usuario_id: usuario.id

    assert_not cliente.save
  end
  test "nao deve salvar Cliente cadastrado sem nome" do
    usuario = Usuario.new nome: 'Usuario Teste',
      cpf: '39775387485',
      funcao: 'Confeiteiro',
      password: 'password1'

      assert usuario.save

    cliente = Cliente.new nome: '',
      cpf: '37287511460',
      contato: '45214521',
      endereco_attributes:{ cidade: 'Garanhuns',
        bairro: 'Boa Vista',
        logradouro: 'Rua Doze, numero 15',
        complemento: 'Apartamento 112'},
      usuario_id: usuario.id

    assert_not cliente.save
  end
  test "nao deve salvar Cliente cadastrado sem endereco" do
    usuario = Usuario.new nome: 'Usuario Teste',
      cpf: '39775387485',
      funcao: 'Confeiteiro',
      password: 'password1'

      assert usuario.save

    cliente = Cliente.new nome: '',
      cpf: '37287511460',
      contato: '45214521',
      usuario_id: usuario.id

    assert_not cliente.save
  end
end
