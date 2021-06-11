class Servico < ApplicationRecord
    belongs_to :usuario
    belongs_to :cliente
    belongs_to :ajudante ,optional: true
    belongs_to :material ,optional: true


    validates :tipoDoServico, presence: true, length: {minimum:8}
    validates :descricao, presence: true, length: {minimum:8}
    validates :valorDoServico, presence: true, length: {minimum:1}

end
