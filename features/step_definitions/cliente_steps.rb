Given('existe um usuario com o nome {string}, CPF-CNPJ {string}, funcao {string} e senha {string}') do |nome, cpf, funcao, senha|
    visit '/entrar'
    click_on 'Criar Usuário'
    fill_in 'usuario_nome',	with: nome
    fill_in 'usuario_cpf',	    with: cpf
    fill_in 'usuario_funcao',	with: funcao
    fill_in 'usuario_password',	with: senha
    click_on 'submit'
end

Given('estou logado no sistema com o login {string} e senha {string}') do |cpf, senha|
    fill_in 'session_cpf',	    with: cpf
    fill_in 'session_password',	with: senha
    click_on 'submit'
end

When('eu entro na pagina clientes') do
    click_on 'clientes'
end

And('clico em novo cliente') do
    click_on 'novo_cliente'
end

When('eu preencho os campos com nome {string}, CPF {string}, contato {string}, cidade {string}, bairro {string}, logradouro {string} e complemento {string}') do |nome, cpf, contato, cidade, bairro, logradouro, complemento|
    fill_in 'cliente_nome',	with: nome
    fill_in 'cliente_cpf',	with: cpf
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
   