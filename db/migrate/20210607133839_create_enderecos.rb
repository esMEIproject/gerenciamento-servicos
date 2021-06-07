class CreateEnderecos < ActiveRecord::Migration[6.1]
  def change
    create_table :enderecos do |t|
      t.string :cidade
      t.string :bairro
      t.string :logradouro
      t.string :complemento

      t.timestamps
    end
  end
end
