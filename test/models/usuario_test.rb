require "test_helper"

class UsuarioTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "deve salvar Usuario criado corretamente" do
    usuario = Usuario.new nome: 'Usuario Teste',
      cpf: '39775387485',
      funcao: 'Confeiteiro',
      password: 'password1'

      assert usuario.save
  end

  test "nao deve salvar Usuario com password menor que 8 caracteres" do
    usuario = Usuario.new nome: 'Usuario Teste',
      cpf: '39775387485',
      funcao: 'Confeiteiro',
      password: 'passw'

      assert_not usuario.save
  end

  test "nao deve salvar Usuario criado com cpf com letras" do
    usuario = Usuario.new nome: 'Usuario Teste',
      cpf: 'sda397753aa',
      funcao: 'Confeiteiro',
      password: 'password01'

      assert_not usuario.save
  end
  #terceira iteração---------------------------------------------
  test "nao deve salvar Usuario criado com cpf invalido" do
    usuario = Usuario.new nome: 'Usuario Teste',
      cpf: '00000000000',
      funcao: 'Confeiteiro',
      password: 'password01'

      assert_not usuario.save
  end
  test "nao deve salvar Usuario sem funcao" do
    usuario = Usuario.new nome: 'Usuario Teste',
      cpf: '39775387485',
      funcao: '',
      password: 'password01'

      assert_not usuario.save
  end
  test "nao deve salvar Usuario com nome maior que 35 caracteres" do
    usuario = Usuario.new nome: 'Maria Raphaela Gonzaga da Rocha e Silva',
      cpf: '39775387485',
      funcao: 'Vendedora',
      password: 'password01'

      assert_not usuario.save
  end
end
