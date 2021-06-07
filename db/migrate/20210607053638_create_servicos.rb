class CreateServicos < ActiveRecord::Migration[6.1]
  def change
    create_table :servicos do |t|
      t.string :tipoDoServico
      t.text :descricao
      t.date :data
      t.float :valorDoServico
      t.boolean :statusDePagamento

      t.timestamps
    end
  end
end
