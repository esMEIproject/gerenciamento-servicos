Given ('um usuario cadastrado com o nome {string}, cpf {string}, funcao {string} e senha {string} existe') do |nome, cpf, funcao, senha|
    visit '/usuarios/new'
    #click_on 'criar_usuario'
    fill_in 'usuario_nome',	with: nome
    fill_in 'usuario_cpf', with: cpf
    fill_in 'usuario_funcao', with: funcao
    fill_in 'usuario_password',	with: senha
    click_on 'submit'
end

And ('eu estou no sistema com o cpf {string} e senha {string}') do |cpf, senha|
    fill_in 'session_cpf',	    with: cpf
    fill_in 'session_password',	with: senha
    click_on 'submit'
end

And ('existe um cliente com o nome de {string}, cpf {string}, contato {string}, cidade {string}, bairro {string}, logradouro {string}, complemento {string}') do |nomeCliente, cpf, contato, cidade, bairro, logradouro, complemento|
    click_on 'clientes'
    click_on 'novo_cliente'
    fill_in 'cliente_nome', with: nomeCliente
    fill_in 'cliente_cpf', with: cpf
    fill_in 'cliente_contato', with: contato
    fill_in 'cliente_endereco_attributes_cidade', with: cidade
    fill_in 'cliente_endereco_attributes_bairro', with: bairro
    fill_in 'cliente_endereco_attributes_logradouro', with: logradouro
    fill_in 'cliente_endereco_attributes_complemento', with: complemento
    click_on 'submit'
end

And ('existe um ajudante com o nome de {string}, cpf {string}, contato {string} e preco da mao de obra {string}') do |nomeAjudante, cpf, contato, preco|
    click_on 'ajudantes'
    click_on 'novo_ajudante'
    fill_in 'ajudante_nome', with: nomeAjudante
    fill_in 'ajudante_cpf', with: cpf
    fill_in 'ajudante_contato', with: contato
    fill_in 'ajudante_precoMaoDeObra', with: preco
    click_on 'submit'
end

And ('um material existe com o nome {string}, descricao {string} e preco {string}') do |nomeMaterial, descricao, preco|
    visit '/materials'
    click_on 'novo_material'
    fill_in 'material_nome', with: nomeMaterial
    fill_in 'material_descricao', with: descricao
    fill_in 'material_valor', with: preco
    click_on 'submit'
end

When ('eu clico em novo servico') do
    visit '/servicos'
    click_on 'novo_servico'
end

And ('eu seleciono o cliente {string}, tipo de servico {string}, descricao do servico {string}, seleciono o ajudante {string}, o material {string}, a data {string} de {string} de {string}, valor do servico {string} e status de pagamento {string}') do |cliente, tipoServico, descricao, ajudante, material, dia, mes, ano, preco, status|
    select cliente, :from => 'servico_cliente_id'
    fill_in 'servico_tipoDoServico', with: tipoServico
    fill_in 'servico_descricao', with: descricao
    select ajudante, :from => 'servico_ajudante_id'
    select material, :from => 'servico_material_id'
    select dia, :from => 'servico_data_3i'
    select mes, :from => 'servico_data_2i'
    select ano, :from => 'servico_data_1i'
    fill_in 'servico_valorDoServico', with: preco
    if status == 'Pago'
        check 'servico_statusDePagamento'
    end
    click_on 'submit'
end

Then ('eu vejo que o servico foi criado com sucesso') do
    expect(page).to have_content('Serviço foi criado com sucesso')
end


Then ('eu vejo uma mensagem informando que cliente deve existir') do
    expect(page).to have_content('Cliente deve existir!')
end

And ('existe o servico com cliente {string}, tipo de servico {string}, descricao do servico {string}, seleciono o ajudante {string}, o material {string}, a data {string} de {string} de {string}, valor do servico {string} e status de pagamento {string}') do |cliente, tipoServico, descricao, ajudante, material, dia, mes, ano, preco, status|
    visit '/servicos'
    click_on 'novo_servico'
    select cliente, :from => 'servico_cliente_id'
    fill_in 'servico_tipoDoServico', with: tipoServico
    fill_in 'servico_descricao', with: descricao
    select ajudante, :from => 'servico_ajudante_id'
    select material, :from => 'servico_material_id'
    select dia, :from => 'servico_data_3i'
    select mes, :from => 'servico_data_2i'
    select ano, :from => 'servico_data_1i'
    fill_in 'servico_valorDoServico', with: preco
    if status == 'Pago'
        check 'servico_statusDePagamento'
    end
    click_on 'submit'
    visit '/servicos'
end

When('eu clico em editar o servico {string} do cliente {string}') do |tipoServico, cliente|
    click_link "e-#{cliente + tipoServico}"
end

And('eu renomeio o tipo de servico para {string}') do |tipoServico|
    fill_in 'servico_tipoDoServico', with: tipoServico
end

When('eu clico em atualizar servico') do 
    click_on 'submit'
end

Then ('eu vejo que o servico foi atualizado com sucesso') do
    expect(page).to have_content('Serviço foi atualizado com sucesso')
end