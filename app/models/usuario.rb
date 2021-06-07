class Usuario < ApplicationRecord

    validates :nome, presence: true, length: {minimum:10}, numericality: false
    validates :cpf,  presence: true, uniqueness: true, length: {is: 11}, numericality: {only_integer: true}
    validates :funcao, presence: true, length: {minimum: 5}
    validates :senha, presence: true, length: {minimum: 8}
end
