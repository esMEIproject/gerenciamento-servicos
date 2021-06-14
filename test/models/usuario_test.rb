require "test_helper"

class UsuarioTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "deve salvar Usuario criado corretamente" do
    usuario = Usuario.new nome: 'Usuario Teste',
      cpf: '12345678912',
      funcao: 'Confeiteiro',
      password: 'password1'

      assert usuario.save
  end

  test "nao deve salvar Usuario com password menor que 8 caracteres" do
    usuario = Usuario.new nome: 'Usuario Teste',
      cpf: '12345678912',
      funcao: 'Confeiteiro',
      password: 'passw'

      assert_not usuario.save
  end

  test "nao deve salvar Usuario criado com cpf com letras" do
    usuario = Usuario.new nome: 'Usuario Teste',
      cpf: '1234567sasda',
      funcao: 'Confeiteiro',
      password: 'passw'

      assert_not usuario.save
  end
end
