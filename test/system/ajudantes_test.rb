require "application_system_test_case"

class AjudantesTest < ApplicationSystemTestCase
  setup do
    @ajudante = ajudantes(:one)
  end

  test "visiting the index" do
    visit ajudantes_url
    assert_selector "h1", text: "Ajudantes"
  end

  test "creating a Ajudante" do
    visit ajudantes_url
    click_on "New Ajudante"

    fill_in "Contato", with: @ajudante.contato
    fill_in "Cpf", with: @ajudante.cpf
    fill_in "Nome", with: @ajudante.nome
    fill_in "Precomaodeobra", with: @ajudante.precoMaoDeObra
    click_on "Create Ajudante"

    assert_text "Ajudante was successfully created"
    click_on "Back"
  end

  test "updating a Ajudante" do
    visit ajudantes_url
    click_on "Edit", match: :first

    fill_in "Contato", with: @ajudante.contato
    fill_in "Cpf", with: @ajudante.cpf
    fill_in "Nome", with: @ajudante.nome
    fill_in "Precomaodeobra", with: @ajudante.precoMaoDeObra
    click_on "Update Ajudante"

    assert_text "Ajudante was successfully updated"
    click_on "Back"
  end

  test "destroying a Ajudante" do
    visit ajudantes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ajudante was successfully destroyed"
  end
end
