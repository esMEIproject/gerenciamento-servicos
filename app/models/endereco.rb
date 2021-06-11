class Endereco < ApplicationRecord

    validates :cidade,presence: true, length:{minimum:3}
    validates :bairro,presence: true, length:{minimum:5}
    validates :logradouro,presence: true, length:{minimum:3}
    validates :complemento,presence: true, length:{minimum:2}

    belongs_to :cliente
end