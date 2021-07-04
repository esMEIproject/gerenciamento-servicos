Given ('um usuario no sistema com nome {string}, cpf {string}, funcao {string} e senha {string} existe') do |nome, cpf, funcao, senha|
    visit '/usuarios/new'
    expect(page).to have_current_path('/usuarios/new')
    fill_in 'usuario_nome',	with: nome
    fill_in 'cpf', with: cpf
    fill_in 'usuario_funcao', with: funcao
    fill_in 'usuario_password',	with: senha
    click_on 'submit'
end

And ('estou logado como usuario com cpf {string} e senha {string}') do |cpf, senha|
    expect(page).to have_current_path('/entrar')
    fill_in 'cpf',	    with: cpf
    fill_in 'session_password',	with: senha
    click_on 'submit'
end

When('eu entro na pagina de clientes') do
    click_on 'clientes'
    expect(page).to have_current_path('/clientes')
end

And('clico para cadastrar novo cliente') do
    click_on 'novo_cliente'
    expect(page).to have_current_path('/clientes/new')
end

When ('eu preencho nome {string}, cpf {string}, contato {string}') do |nome, cpf, contato|
    fill_in 'cliente_nome', with: nome
    fill_in 'cpf', with: cpf
    fill_in 'cliente_contato', with: contato
end

And ('os campos de endereco Cidade {string}, Bairro {string}, Logradouro {string} e Complemento {string}') do |cidade, bairro, logradouro, complemento|
    fill_in 'cliente_endereco_attributes_cidade',	with: cidade
    fill_in 'cliente_endereco_attributes_bairro',	with: bairro
    fill_in 'cliente_endereco_attributes_logradouro',	with: logradouro
    fill_in 'cliente_endereco_attributes_complemento',	with: complemento
end

When ('eu clico para cadastrar cliente') do
    click_on 'submit'
end

Then('eu vejo uma mensagem que cliente foi criado com sucesso') do
    expect(page).to have_content('Cliente foi criado com sucesso')
end

Then('eu vejo uma mensagem informando que cidade nao pode ser em branco') do
    expect(page).to have_content('Cidade não pode ficar em branco')
end

Then('eu vejo uma mensagem informando que campo bairro e muito curto') do
    expect(page).to have_content('Bairro é muito curto (mínimo: 4 caracteres)')
end

And ('existe um cliente cadastrado como nome {string}, cpf {string}, contato {string}, cidade {string}, bairro {string}, logradouro {string} e complemento {string}') do |nome, cpf, contato, cidade, bairro, logradouro, complemento|
    click_on 'novo_cliente'
    expect(page).to have_current_path('/clientes/new')
    fill_in 'cliente_nome', with: nome
    fill_in 'cpf', with: cpf
    fill_in 'cliente_contato', with: contato
    fill_in 'cliente_endereco_attributes_cidade',	with: cidade
    fill_in 'cliente_endereco_attributes_bairro',	with: bairro
    fill_in 'cliente_endereco_attributes_logradouro',	with: logradouro
    fill_in 'cliente_endereco_attributes_complemento',	with: complemento
    click_on 'submit'
    visit '/clientes'
    expect(page).to have_current_path('/clientes')
end

When ('eu clico em editar o cliente {string}') do |nome|
    click_on "e-#{nome}"
end

And ('renomeio o campo de complemento para {string}') do |complemento|
    fill_in 'cliente_endereco_attributes_complemento',	with: complemento
end

When ('eu clico em atualizar cliente') do
    click_on "submit"
end

Then ('eu vejo uma mensagem que cliente foi atualizado corretamente') do
    expect(page).to have_content('Cliente foi atualizado com sucesso')
end

Then('eu vejo uma mensagem que informando que campo cidade e muito longo') do
    expect(page).to have_content('Cidade é muito longo (máximo: 35 caracteres)')
end