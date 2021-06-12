require "test_helper"

class AjudanteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "deve salvar Ajudante cadastrado corretamente" do
    usuario = Usuario.new nome: 'Usuario Teste',
    cpf: '12345678912',
    funcao: 'Gesseiro',
    password: 'password1'

    usuario.save

    ajudante = Ajudante.new nome: 'Ajudante Teste',
    cpf: '12678721442',
    contato: '00000000',
    precoMaoDeObra: '400',
    usuario_id: usuario.id

    assert ajudante.save
  end

  test "Nao deve salvar Ajudante com cpf invalido" do
    usuario = Usuario.new nome: 'Usuario Teste',
    cpf: '12345678912',
    funcao: 'Gesseiro',
    password: 'password1'

    usuario.save

    ajudante = Ajudante.new nome: 'Ajudante Teste',
    cpf: '12678721a',
    contato: '00000000',
    precoMaoDeObra: '400',
    usuario_id: usuario.id

    assert_not ajudante.save
  end
  
  test "Nao deve salvar Ajudante contato invalido" do
    usuario = Usuario.new nome: 'Usuario Teste',
    cpf: '12345678912',
    funcao: 'Gesseiro',
    password: 'password1'

    usuario.save

    ajudante = Ajudante.new nome: 'Ajudante Teste',
    cpf: '12678721a',
    contato: 'AA000000',
    precoMaoDeObra: '400',
    usuario_id: usuario.id

    assert_not ajudante.save
  end
end
