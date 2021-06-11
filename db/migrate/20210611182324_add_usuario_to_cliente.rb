class AddUsuarioToCliente < ActiveRecord::Migration[6.1]
  def change
    add_reference :clientes, :usuario, foreign_key: true
  end
end
