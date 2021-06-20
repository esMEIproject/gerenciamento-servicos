class Servico < ApplicationRecord
    belongs_to :usuario
    belongs_to :cliente
    belongs_to :ajudante ,optional: true
    belongs_to :material ,optional: true


    validates :tipoDoServico, presence: true, length: {in: 5..35}
    validates :descricao, presence: true, length: {in: 8..55}
    validates_date :data, on_or_after: -> (_lambda){Date.current}
    validates :valorDoServico, presence: true, numericality: {only_float:true, greater_than_or_equal_to: 1.0, less_than_or_equal_to: 1000000.0}

end
