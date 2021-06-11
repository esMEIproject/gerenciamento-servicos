class AddUsuarioToMaterial < ActiveRecord::Migration[6.1]
  def change
    add_reference :materials, :usuario, foreign_key: true
  end
end
