Given('eu estou na pagina de login') do
    visit '/entrar'
end

And('eu clico para cadastrar um novo usuario') do
    click_on 'criar_usuario'
end

When('eu preencho os campos de nome {string}, cpf {string}, funcao {string} e senha {string}') do |nome, cpf, funcao, senha|
    fill_in 'usuario_nome',	with: nome
    fill_in 'usuario_cpf', with: cpf
    fill_in 'usuario_funcao', with: funcao
    fill_in 'usuario_password', with: senha
end

And('eu clico em cadastrar usuario') do
    click_on 'submit'
end

Given('existe um usuario cadastrado com o nome {string}, cpf {string}, funcao {string} e senha {string}') do |nome, cpf, funcao, senha|
    click_on 'Criar Usuário'
    fill_in 'usuario_nome',	with: nome
    fill_in 'usuario_cpf', with: cpf
    fill_in 'usuario_funcao', with: funcao
    fill_in 'usuario_password',	with: senha
    click_on 'submit'
end
  

Then('eu vejo uma mensagem que usuario foi cadastrado corretamente') do
    expect(page).to have_content('Usuário foi criado com sucesso.')
end

Then('eu vejo uma mensagem de usuario invalido') do
    assert_selector('div#error_explanation')
end

Given('eu estou logado no sistema com o cpf {string} e senha {string}') do |cpf, senha|
    fill_in 'session_cpf',	    with: cpf
    fill_in 'session_password',	with: senha
    click_on 'submit'
end

And('eu clico em visualizar minha conta') do
    click_on 'minha_conta'
end

And('eu clico em editar') do
    click_on 'editar_usuario'
end

When('eu preencho o campo cpf {string} e senha {string}') do |cpf, senha|
    fill_in 'usuario_cpf', with: cpf
    fill_in 'usuario_password', with: senha
end

And('eu clico em atualizar usuario') do
    click_on 'submit'
end
