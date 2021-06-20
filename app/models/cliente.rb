class Cliente < ApplicationRecord
    has_one :endereco, :dependent => :destroy
    has_many :servicos, :dependent => :restrict_with_error
    belongs_to :usuario

    validates :nome, presence: true, length: {in:6..35}, numericality: false
    validates :cpf, presence: true, uniqueness: true, length: {is:11}, numericality: {only_integer:true}
    validates :contato, presence: true, length: {in:8..15}, numericality: {only_integer:true}
    accepts_nested_attributes_for :endereco

end
