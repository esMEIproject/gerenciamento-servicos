class Cliente < ApplicationRecord
    has_one :endereco, :dependent => :destroy
    has_many :servicos, :dependent => :restrict_with_error
    belongs_to :usuario

    validates :nome, presence: true, length: {in:6..35}, format: {with: /\A[a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+\z/ }
    validates_cpf_format_of :cpf
    validates :cpf, uniqueness: true
    validates :contato, presence: true, length: {in:8..15}, numericality: {only_integer:true}
    accepts_nested_attributes_for :endereco

end
