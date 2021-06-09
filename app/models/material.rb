class Material < ApplicationRecord

    validates :nome, presence: true, length: {minimum:4}, numericality: false
    validates :descricao, presence: true, length: {minimum:4}, numericality: false
    validates :valor, presence: true    
end
