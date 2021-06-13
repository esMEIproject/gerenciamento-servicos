Given('existe um usuario com o nome {string}, cpf {string}, funcao {string} e senha {string}') do |nome, cpf, funcao, senha|
    visit '/entrar'
    click_on 'Criar Usuário'
    fill_in 'usuario_nome',	with: nome
    fill_in 'usuario_cpf',	    with: cpf
    fill_in 'usuario_funcao',	with: funcao
    fill_in 'usuario_password',	with: senha
    click_on 'submit'
end

Given('estou logado no sistema com o cpf {string} e senha {string}') do |cpf, senha|
    fill_in 'session_cpf',	    with: cpf
    fill_in 'session_password',	with: senha
    click_on 'submit'
end

When('eu entro na pagina Ajudantes') do
    click_on 'ajudantes'
end

And('clico em novo ajudante') do
    click_on 'novo_ajudante'
end

When('eu preencho os campos de nome {string}, cpf {string}, contato {string} e preco da mao de obra {string}') do |nome, cpf, contato, preco|
    fill_in 'ajudante_nome', with: nome
    fill_in 'ajudante_cpf',	with: cpf
    fill_in 'ajudante_contato',	with: contato
    fill_in 'ajudante_precoMaoDeObra', with: preco
end
  

And('clico em cadastrar ajudante') do
    click_on 'submit'
end

Then('eu vejo que o novo ajudante com o nome {string} foi criado') do |nome|
    expect(page).to have_content(nome)
end

And('existe um ajudante com o nome {string}, cpf {string}, contato {string} e preco da mao de obra {string}') do |nome, cpf, contato, preco|
    click_on 'novo_ajudante'
    fill_in 'ajudante_nome', with: nome
    fill_in 'ajudante_cpf',	with: cpf
    fill_in 'ajudante_contato',	with: contato
    fill_in 'ajudante_precoMaoDeObra', with: preco
    click_on 'submit'
end

When('eu clico em apagar ajudante {string}') do |nome|
    click_on 'ajudantes'
    click_link "d-#{nome}"
end

Then('eu vejo que o ajudante com nome {string} nao se encontra mais na pagina') do |nome|
    expect(page).to have_no_content(nome)
end

  