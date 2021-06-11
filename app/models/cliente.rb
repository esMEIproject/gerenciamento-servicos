class Cliente < ApplicationRecord
    has_one :endereco, :dependent => :destroy
    has_many :servicos
    belongs_to :usuario

    validates :nome, presence: true, length: {minimum:10}, numericality: false
    validates :cpf, presence: true, uniqueness: true, length: {is:11}, numericality: {only_integer:true}
    accepts_nested_attributes_for :endereco

end
