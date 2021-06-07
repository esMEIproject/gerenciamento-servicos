class CreateAjudantes < ActiveRecord::Migration[6.1]
  def change
    create_table :ajudantes do |t|
      t.string :nome
      t.string :cpf
      t.string :contato
      t.float :precoMaoDeObra

      t.timestamps
    end
  end
end
