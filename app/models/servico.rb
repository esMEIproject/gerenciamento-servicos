class Servico < ApplicationRecord
    belongs_to :usuario
    belongs_to :cliente
end
