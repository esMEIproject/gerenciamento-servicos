class AddUsuarioToServico < ActiveRecord::Migration[6.1]
  def change
    add_reference :servicos, :usuario, foreign_key: true
  end
end
