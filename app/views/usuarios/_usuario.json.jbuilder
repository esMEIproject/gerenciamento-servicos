json.extract! usuario, :id, :nome, :cpf, :funcao, :senha, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
