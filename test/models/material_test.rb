require "test_helper"

class MaterialTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "nao deve salvar Material cadastrado com valor igual a 0" do
    usuario = Usuario.new nome: 'Usuario Teste',
      cpf: '39775387485',
      funcao: 'Confeiteiro',
      password: 'password1'

      usuario.save

    material = Material.new nome: 'Massa de Chocolate',
      descricao: 'Chocolate meio amargo sem lactose',
      valor: '0',
      usuario_id: usuario.id    

    assert_not material.save
  end

  test "deve salvar Material cadastrado corretamente" do
    usuario = Usuario.new nome: 'Usuario Teste',
      cpf: '39775387485',
      funcao: 'Confeiteiro',
      password: 'password1'

      usuario.save

    material = Material.new nome: 'Massa de Chocolate',
      descricao: 'Chocolate meio amargo sem lactose',
      valor: '40',
      usuario_id: usuario.id       

    assert material.save
  end

  test "nao deve salvar Material cadastrado com descricao do material menor que o tamanho exigido" do
    usuario = Usuario.new nome: 'Usuario Teste',
      cpf: '39775387485',
      funcao: 'Confeiteiro',
      password: 'password1'

      usuario.save

    material = Material.new nome: 'Massa de Chocolate',
      descricao: 'Ch',
      valor: '40',
      usuario_id: usuario.id         

    assert_not material.save
  end
  
#--------3 iteracao --------
  test "nao deve salvar Material cadastrado com nome do material menor que o exigido" do
    usuario = Usuario.new nome: 'Usuario Teste',
      cpf: '39775387485',
      funcao: 'Confeiteiro',
      password: 'password1'

      usuario.save

    material = Material.new nome: 'Ma',
      descricao: 'Chocolate meio amargo sem lactose',
      valor: '40',
      usuario_id: usuario.id         

    assert_not material.save
  end

  test "nao deve salvar Material cadastrado com valor invalido" do
    usuario = Usuario.new nome: 'Usuario Teste',
      cpf: '39775387485',
      funcao: 'Confeiteiro',
      password: 'password1'

      usuario.save

    material = Material.new nome: 'Massa de Chocolate',
      descricao: 'Chocolate meio amargo sem lactose',
      valor: 'abcd',
      usuario_id: usuario.id    

    assert_not material.save
  end

  test "nao deve salvar Material cadastrado com nome do material maior que o exigido" do
    usuario = Usuario.new nome: 'Usuario Teste',
      cpf: '39775387485',
      funcao: 'Confeiteiro',
      password: 'password1'

      usuario.save

    material = Material.new nome: 'Massa de Chocolate da cacaushow com açucar refinado branco',
      descricao: 'Chocolate meio amargo sem lactose',
      valor: '40',
      usuario_id: usuario.id         

    assert_not material.save
  end

end