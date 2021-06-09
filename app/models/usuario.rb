class Usuario < ApplicationRecord

    validates :nome, presence: true, length: {minimum:7}, numericality: false
    validates :cpf,  presence: true, uniqueness: true, length: {in: 11..14}, numericality: {only_integer: true}
    validates :funcao, presence: true, length: {minimum: 2}
    validates :senha, presence: true, length: {minimum: 8}
end
