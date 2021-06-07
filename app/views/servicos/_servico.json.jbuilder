json.extract! servico, :id, :tipoDoServico, :descricao, :data, :valorDoServico, :statusDePagamento, :created_at, :updated_at
json.url servico_url(servico, format: :json)
