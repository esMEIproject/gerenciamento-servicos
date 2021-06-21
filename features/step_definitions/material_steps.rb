Given('existe um usuario ja cadastrado no sistema com o nome {string}, CPF {string}, funcao {string} e senha {string}') do |nome, cpf, funcao, senha|
    visit '/entrar'
    click_on 'Criar Usuário'
    fill_in 'usuario_nome',	with: nome
    fill_in 'cpf',	    with: cpf
    fill_in 'usuario_funcao',	with: funcao
    fill_in 'usuario_password',	with: senha
    click_on 'submit'
end

Given('estou entrando no sistema com o login {string} e senha {string}') do |cpf, senha|
    fill_in 'cpf',	    with: cpf
    fill_in 'session_password',	with: senha
    click_on 'submit'
end

When('clico em novo material') do
    visit '/materials'
    click_on 'novo_material'
end

When('eu preencho os campos com materiais {string} , descricao {string} e preco {string}') do |nomeMaterial, descricao, preco|
    fill_in 'material_nome', with: nomeMaterial
    fill_in 'material_descricao', with: descricao
    fill_in 'material_valor', with: preco
end

And ('eu clico em cadastrar material') do
    click_on 'submit'
end

Then('eu vejo uma mensagem informando que o material foi criado com sucesso') do
    expect(page).to have_content('Material foi criado com sucesso')
end

And ('existe um material com materiais {string} , descricao {string} e preco {string}') do |nomeMaterial, descricao, preco|
    visit '/materials'
    click_on 'novo_material'
    fill_in 'material_nome', with: nomeMaterial
    fill_in 'material_descricao', with: descricao
    fill_in 'material_valor', with: preco
    click_on 'submit'
end

When('eu entro na pagina de visualizar materiais') do
    visit '/materials'
end

And('eu clico em apagar o material {string}') do |nomeMaterial|
    click_link "d-#{nomeMaterial}"
end

And('eu clico em editar o material {string}') do |nomeMaterial|
    click_link "e-#{nomeMaterial}"
end

And('eu renomeio o campo preco para {string}') do |preco|
    fill_in 'material_valor', with: preco
end

And('eu renomeio o campo materiais para {string}') do |nomeMaterial|
    fill_in 'material_nome', with: nomeMaterial
end

When('eu clico em atualizar material') do 
    click_on 'submit'
end

Then('eu vejo que o material {string} nao se encontra mais na pagina') do |nomeMaterial|
    expect(page).to have_no_content(nomeMaterial)
end

Then('Eu vejo uma mensagem informando que material foi editado com sucesso') do
    expect(page).to have_content('Material foi atualizado com sucesso')
end

Then('eu vejo uma mensagem de erro informando que o nome e muito curto') do
    expect(page).to have_content('Nome é muito curto (mínimo: 4 caracteres)')
end