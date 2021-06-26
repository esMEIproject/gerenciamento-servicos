class Usuario < ApplicationRecord
    has_many :servicos, :dependent => :destroy
    has_many :ajudantes, :dependent => :destroy
    has_many :clientes, :dependent => :destroy
    has_many :materials, :dependent => :destroy
    
    
    validates :nome, presence: true,length: {in:6..35}, format: {with: /\A[a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+\z/ }
    validates_cpf_format_of :cpf
    validates :cpf, uniqueness: true
    validates :funcao, presence: true, length: {in:5..35}
    validates :password, presence: true, length: {in:8..35}
    has_secure_password
end
