class AddMaterialToServicos < ActiveRecord::Migration[6.1]
  def change
    add_reference :servicos, :material, foreign_key: true
  end
end
