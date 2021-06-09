class AddClienteToEndereco < ActiveRecord::Migration[6.1]
  def change
    add_reference :enderecos, :cliente, foreign_key: true
  end
end
