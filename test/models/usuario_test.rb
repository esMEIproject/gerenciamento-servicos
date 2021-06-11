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
end
