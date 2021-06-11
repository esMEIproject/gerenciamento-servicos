require "test_helper"

class MaterialTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "nao deve salvar Material cadastrado com valor igual a 0" do
    usuario = Usuario.new nome: 'Usuario Teste',
      cpf: '12345678912',
      funcao: 'Confeiteiro',
      password: 'password1'

      usuario.save

    material = Material.new nome: 'Massa de Chocolate',
      descricao: 'Chocolate meio amargo sem lactose',
      valor: '0'      

    assert_not material.save
  end

  test "deve salvar Material cadastrado corretamente" do
    usuario = Usuario.new nome: 'Usuario Teste',
      cpf: '12345678912',
      funcao: 'Confeiteiro',
      password: 'password1'

      usuario.save

    material = Material.new nome: 'Massa de Chocolate',
      descricao: 'Chocolate meio amargo sem lactose',
      valor: '40'        

    assert material.save
  end

  test "nao deve salvar Material cadastrado com descricao do material menor que o tamanho exigido" do
    usuario = Usuario.new nome: 'Usuario Teste',
      cpf: '12345678912',
      funcao: 'Confeiteiro',
      password: 'password1'

      usuario.save

    material = Material.new nome: 'Massa de Chocolate',
      descricao: 'Ch',
      valor: '40'          

    assert_not material.save
  end
end
