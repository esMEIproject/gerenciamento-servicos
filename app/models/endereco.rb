class Endereco < ApplicationRecord

    validates :cidade,presence: true, length:{minimum:3}
    validates :bairro,presence: true, length:{minimum:3}
    validates :logradouro,presence: true, length:{minimum:3}
    validates :complemento,presence: true
end