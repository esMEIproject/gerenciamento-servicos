class Cliente < ApplicationRecord
    has_one :endereco
    has_many :servicos
end
