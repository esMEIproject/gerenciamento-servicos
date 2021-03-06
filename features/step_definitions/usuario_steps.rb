Given('eu estou na pagina de login') do
    visit '/entrar'
    expect(page).to have_current_path('/entrar')
end

And('eu clico para cadastrar um novo usuario') do
    click_on 'criar_usuario'
    expect(page).to have_current_path('/usuarios/new')
end

When('eu preencho os campos de nome {string}, cpf {string}, funcao {string} e senha {string}') do |nome, cpf, funcao, senha|
    fill_in 'usuario_nome',	with: nome
    fill_in 'cpf', with: cpf
    fill_in 'usuario_funcao', with: funcao
    fill_in 'usuario_password', with: senha
end

And('eu clico em cadastrar usuario') do
    click_on 'submit'
end

Given('existe um usuario com o nome {string}, cpf {string}, funcao-cargo {string} e senha {string}') do |nome, cpf, funcaocargo, senha|
    click_on 'criar_usuario'
    expect(page).to have_current_path('/usuarios/new')
    fill_in 'usuario_nome',	with: nome
    fill_in 'cpf', with: cpf
    fill_in 'usuario_funcao', with: funcaocargo
    fill_in 'usuario_password',	with: senha
    click_on 'submit'
end  

Then('eu vejo uma mensagem que usuario foi cadastrado corretamente') do
    expect(page).to have_content('Usuário foi criado com sucesso.')
end

Then('eu vejo uma mensagem informando que cpf nao e valido') do
    expect(page).to have_content('CPF não é um CPF válido')
end
Then('eu vejo uma mensagem informando que nome nao pode ser vazio') do
    expect(page).to have_content('Nome não pode ficar em branco')
end

Given('eu estou logado no sistema com o cpf {string} e senha {string}') do |cpf, senha|
    expect(page).to have_current_path('/entrar')
    fill_in 'cpf',	    with: cpf
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
    fill_in 'cpf', with: cpf
    fill_in 'usuario_password', with: senha
end

And('eu clico em atualizar usuario') do
    click_on 'submit'
end

Then('eu vejo uma mensagem informando que cpf deve ter apenas numeros') do
    expect(page).to have_content('CPF deve ser um número')
end

Then('eu vejo uma mensagem informando que cpf ja existe') do
    expect(page).to have_content('CPF já está em uso')
end

Then('eu vejo uma mensagem informando que cpf nao pode ser vazio') do
    expect(page).to have_content('CPF não pode ficar em branco')
end
