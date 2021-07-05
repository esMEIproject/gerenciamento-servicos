require "test_helper"

class AjudanteTest < ActiveSupport::TestCase
 
  test "deve salvar Ajudante cadastrado corretamente" do
    usuario = Usuario.new nome: 'Usuario Teste',
    cpf: '12558002082',
    funcao: 'Gesseiro',
    password: 'password1'

    assert usuario.save

    ajudante = Ajudante.new nome: 'Ajudante Teste',
    cpf: '33940570001',
    contato: '12345678',
    precoMaoDeObra: '400',
    usuario_id: usuario.id

    assert ajudante.save
  end

  test "Nao deve salvar Ajudante com cpf invalido" do
    usuario = Usuario.new nome: 'Usuario Teste',
    cpf: '12558002082',
    funcao: 'Gesseiro',
    password: 'password1'

    assert usuario.save

    ajudante = Ajudante.new nome: 'Ajudante Teste',
    cpf: '3394057000a',
    contato: '12345678',
    precoMaoDeObra: '400',
    usuario_id: usuario.id

    assert_not ajudante.save
  end
  
  test "Nao deve salvar Ajudante com contato invalido" do
    usuario = Usuario.new nome: 'Usuario Teste',
    cpf: '12558002082',
    funcao: 'Gesseiro',
    password: 'password1'

    assert usuario.save

    ajudante = Ajudante.new nome: 'Ajudante Teste',
    cpf: '33940570001',
    contato: 'AA000000',
    precoMaoDeObra: '400',
    usuario_id: usuario.id

    assert_not ajudante.save
  end

  #-------------------3 iteracao------------------------------

  test "Nao deve salvar ajudante com campo nome vazio" do
    usuario = Usuario.new nome: 'Usuario Teste',
    cpf: '12558002082',
    funcao: 'Gesseiro',
    password: 'password1'

    assert usuario.save

    ajudante = Ajudante.new nome: '',
    cpf: '33940570001',
    contato: '12345678',
    precoMaoDeObra: '400',
    usuario_id: usuario.id

    assert_not ajudante.save
  end

  test "Nao deve salvar ajudante com preco da mao de obra vazio" do
    usuario = Usuario.new nome: 'Usuario Teste',
    cpf: '12558002082',
    funcao: 'Gesseiro',
    password: 'password1'

    assert usuario.save

    ajudante = Ajudante.new nome: 'Ajudante Teste',
    cpf: '33940570001',
    contato: '12345678',
    precoMaoDeObra: '',
    usuario_id: usuario.id

    assert_not ajudante.save
  end

  test "Nao deve salvar ajudante com cpf ja existente" do
    usuario = Usuario.new nome: 'Usuario Teste',
    cpf: '12558002082',
    funcao: 'Gesseiro',
    password: 'password1'

    assert usuario.save

    ajudante = Ajudante.new nome: 'Ajudante Teste',
    cpf: '33940570001',
    contato: '12345678',
    precoMaoDeObra: '400',
    usuario_id: usuario.id

    assert ajudante.save

    ajudante2 = Ajudante.new nome: 'Ajudante II',
    cpf: '33940570001',
    contato: '147852369',
    precoMaoDeObra: '200',
    usuario_id: usuario.id

    assert_not ajudante2.save
  end
end
