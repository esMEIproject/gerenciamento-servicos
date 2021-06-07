require "test_helper"

class AjudantesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ajudante = ajudantes(:one)
  end

  test "should get index" do
    get ajudantes_url
    assert_response :success
  end

  test "should get new" do
    get new_ajudante_url
    assert_response :success
  end

  test "should create ajudante" do
    assert_difference('Ajudante.count') do
      post ajudantes_url, params: { ajudante: { contato: @ajudante.contato, cpf: @ajudante.cpf, nome: @ajudante.nome, precoMaoDeObra: @ajudante.precoMaoDeObra } }
    end

    assert_redirected_to ajudante_url(Ajudante.last)
  end

  test "should show ajudante" do
    get ajudante_url(@ajudante)
    assert_response :success
  end

  test "should get edit" do
    get edit_ajudante_url(@ajudante)
    assert_response :success
  end

  test "should update ajudante" do
    patch ajudante_url(@ajudante), params: { ajudante: { contato: @ajudante.contato, cpf: @ajudante.cpf, nome: @ajudante.nome, precoMaoDeObra: @ajudante.precoMaoDeObra } }
    assert_redirected_to ajudante_url(@ajudante)
  end

  test "should destroy ajudante" do
    assert_difference('Ajudante.count', -1) do
      delete ajudante_url(@ajudante)
    end

    assert_redirected_to ajudantes_url
  end
end
