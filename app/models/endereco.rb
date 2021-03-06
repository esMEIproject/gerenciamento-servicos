class Endereco < ApplicationRecord

    validates :cidade,presence: true,  length: {in:3..35}, format: {with: /\A[a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+\z/ }
    validates :bairro,presence: true,  length: {in:4..35}
    validates :logradouro,presence: true,  length: {in:4..35}
    validates :complemento,presence: true,  length: {in:3..35}

    belongs_to :cliente
end