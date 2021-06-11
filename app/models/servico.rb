class Servico < ApplicationRecord
    belongs_to :usuario
    belongs_to :cliente
    belongs_to :ajudante ,optional: true
    belongs_to :material ,optional: true


    validates :tipoDoServico, presence: true, length: {minimum:8}
    validates :descricao, presence: true, length: {minimum:8}
    validates_date :data, on_or_after: -> (_lambda){Date.current}
    validates :valorDoServico, presence: true, numericality: {only_float:true, greater_than: 100}

end
