class Material < ApplicationRecord
    has_many :servico, :dependent => :nullify
    belongs_to :usuario

    validates :nome, presence: true, length: {in:4..35}, numericality: false
    validates :descricao, presence: true, length: {in:8..50}, numericality: false
    validates :valor, presence: true, numericality: {only_float:true, greater_than: 10}    
end
