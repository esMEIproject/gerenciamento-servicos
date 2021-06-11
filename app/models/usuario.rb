class Usuario < ApplicationRecord
    has_many :servicos, :dependent => :destroy
    has_secure_password
    
    validates :nome, presence: true, length: {minimum:8}, numericality: false
    validates :cpf,  presence: true, uniqueness: true, length: {is: 11}, numericality: {only_integer: true}
    validates :funcao, presence: true, length: {minimum: 5}
    validates :password, presence: true, length: {minimum: 8}
end
