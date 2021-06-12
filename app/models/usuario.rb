class Usuario < ApplicationRecord
    has_many :servicos, :dependent => :destroy
    has_many :ajudantes, :dependent => :destroy
    has_many :clientes, :dependent => :destroy
    has_many :materials, :dependent => :destroy
    
    
    validates :nome, presence: true, length: {minimum:8}, numericality: false
    validates :cpf,  presence: true, uniqueness: {:message => 'informado já existe.'}, length: {is: 11}, numericality: {only_integer: true}
    validates :funcao, presence: true, length: {minimum: 5}
    validates :password, presence: true, length: {minimum: 8}
    has_secure_password
end
