class Ajudante < ApplicationRecord
    has_many :servicos, :dependent => :nullify
    belongs_to :usuario

    validates :nome, presence: true, length: {in:6..35}, numericality: false
    validates_cpf_format_of :cpf
    validates :cpf, uniqueness: true
    validates :contato, presence: true, length: {in:8..15}, numericality: {only_integer:true}
    validates :precoMaoDeObra, presence: true, numericality: {only_float:true, greater_than_or_equal_to: 1.0, less_than_or_equal_to: 10000.0}
end
