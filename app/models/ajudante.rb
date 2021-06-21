class Ajudante < ApplicationRecord
    has_many :servicos, :dependent => :nullify
    belongs_to :usuario

    validates :nome, presence: true, length: {minimum:8}, numericality: false
    validates_cpf_format_of :cpf
    validates :cpf, uniqueness: true
    validates :contato, presence: true, length: {minimum:8}, numericality: {only_integer:true}
    validates :precoMaoDeObra, presence: true, numericality: {only_float:true, greater_than: 24}
end
