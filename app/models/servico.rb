class Servico < ApplicationRecord
    belongs_to :usuario
    belongs_to :cliente
    belongs_to :ajudante ,optional: true 
    has_many :material

    validates :tipoDoServico, presence: true, length: {minimum:8}
    validates :descricao, presence: true, length: {minimum:8}
    validates_date :data, on_or_after: f = lambda { Date.current }
    validates :valorDoServico, presence: true, length: {minimum:1}

end
