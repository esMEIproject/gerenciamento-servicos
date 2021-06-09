class Cliente < ApplicationRecord
    has_one :endereco, :dependent => :destroy
    has_many :servicos

    accepts_nested_attributes_for :endereco
end
