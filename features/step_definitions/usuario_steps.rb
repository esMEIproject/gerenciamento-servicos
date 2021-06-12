Given('eu estou na pagina de login') do
    visit '/entrar'
end

And('eu clico para cadastrar um novo usuario') do
    click_on 'Criar Usuário'
end

When('eu preencho os campos de nome {string}, CPF-CNPJ {string}, funcao {string} e senha {string}') do |nome, cpf, funcao, senha|
    fill_in 'usuario_nome',	with: nome
    fill_in 'usuario_cpf',	    with: cpf
    fill_in 'usuario_funcao',	with: funcao
    fill_in 'usuario_password',	with: senha
end

And('eu clico em cadastrar usuario') do
    click_on 'submit'
end

Given('existe um usuario cadastrado com o nome {string}, CPF-CNPJ {string}, funcao {string} e senha {string}') do |nome, cpf, funcao, senha|
    click_on 'Criar Usuário'
    fill_in 'usuario_nome',	with: nome
    fill_in 'usuario_cpf',	    with: cpf
    fill_in 'usuario_funcao',	with: funcao
    fill_in 'usuario_password',	with: senha
    click_on 'submit'
  end
  

Then('eu vejo uma mensagem informando que {string}') do |mensagem|
    expect(page).to have_content(mensagem)
end

Then('eu vejo uma mensagem de erro informando que {string}') do |mensagem|
    expect(page).to have_content(mensagem)
end
  
  
