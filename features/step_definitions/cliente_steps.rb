Given('existe um usuario cadastrado com o nome {string}, CPF {string}, funcao {string} e senha {string}') do |nome, cpf, funcao, senha|
    visit '/entrar'
    expect(page).to have_current_path('/entrar')
    click_on 'criar_usuario'
    expect(page).to have_current_path('/usuarios/new')
    fill_in 'usuario_nome',	with: nome
    fill_in 'cpf',	    with: cpf
    fill_in 'usuario_funcao',	with: funcao
    fill_in 'usuario_password',	with: senha
    click_on 'submit'
end

Given('estou logado no sistema com o login {string} e senha {string}') do |cpf, senha|
    fill_in 'cpf',	    with: cpf
    fill_in 'session_password',	with: senha
    click_on 'submit'
end

When('eu entro na pagina clientes') do
    click_on 'clientes'
    expect(page).to have_current_path('/clientes')
end

And('clico em novo cliente') do
    click_on 'novo_cliente'
    expect(page).to have_current_path('/clientes/new')
end

When('eu preencho os campos com nome {string}, cpf {string}, contato {string}, cidade {string}, bairro {string}, logradouro {string} e complemento {string}') do |nome, cpf, contato, cidade, bairro, logradouro, complemento|
    fill_in 'cliente_nome',	with: nome
    fill_in 'cpf',	with: cpf
    fill_in 'cliente_contato',	with: contato
    fill_in 'cliente_endereco_attributes_cidade',	with: cidade
    fill_in 'cliente_endereco_attributes_bairro',	with: bairro
    fill_in 'cliente_endereco_attributes_logradouro',	with: logradouro
    fill_in 'cliente_endereco_attributes_complemento',	with: complemento
end

And ('eu clico em cadastrar cliente') do
    click_on 'submit'
end

Then('eu vejo uma mensagem informando que o cliente foi criado com sucesso') do
    expect(page).to have_content('Cliente foi criado com sucesso')
end
Then('eu vejo uma mensagem de erro informando que o nome nao pode ficar em branco') do
    expect(page).to have_content('Nome não pode ficar em branco')
end 
And('existe um cliente com nome {string}, cpf {string}, contato {string}, cidade {string}, bairro {string}, logradouro {string} e complemento {string}') do |nome, cpf, contato, cidade, bairro, logradouro, complemento|
    click_on 'novo_cliente'
    expect(page).to have_current_path('/clientes/new')
    fill_in 'cliente_nome',	with: nome
    fill_in 'cpf',	with: cpf
    fill_in 'cliente_contato',	with: contato
    fill_in 'cliente_endereco_attributes_cidade',	with: cidade
    fill_in 'cliente_endereco_attributes_bairro',	with: bairro
    fill_in 'cliente_endereco_attributes_logradouro',	with: logradouro
    fill_in 'cliente_endereco_attributes_complemento',	with: complemento
    click_on 'submit'
    visit '/clientes'
end
When('clico em editar cliente com o nome {string}') do |cliente|
    click_on "e-#{cliente}"
end
And('edito os dados com nome {string}, cpf {string}, contato {string}, cidade {string}, bairro {string}, logradouro {string} e complemento {string}') do |nome, cpf, contato, cidade, bairro, logradouro, complemento|                                                                                                                    
    fill_in 'cliente_nome',	with: nome
    fill_in 'cpf',	with: cpf
    fill_in 'cliente_contato',	with: contato
    fill_in 'cliente_endereco_attributes_cidade',	with: cidade
    fill_in 'cliente_endereco_attributes_bairro',	with: bairro
    fill_in 'cliente_endereco_attributes_logradouro',	with: logradouro
    fill_in 'cliente_endereco_attributes_complemento',	with: complemento
    
end
When('clico em atualizar cliente') do
    click_on 'submit'  
end
Then('eu vejo uma mensagem informando que o cliente foi atualizado') do
    expect(page).to have_content('Cliente foi atualizado com sucesso')
end
Then('eu vejo uma mensagem de erro informando que o cpf ja existe') do
    expect(page).to have_content('Cpf já está em uso')
end

When('clico em apagar cliente com o nome {string}') do |cliente|
    click_on "d-#{cliente}"
end

Then('eu vejo uma mensagem informando que o cliente foi apagado') do
    expect(page).to have_content('Cliente foi apagado com sucesso')
end
  
  
   