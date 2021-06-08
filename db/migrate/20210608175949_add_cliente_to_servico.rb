class AddClienteToServico < ActiveRecord::Migration[6.1]
  def change
    add_reference :servicos, :cliente, foreign_key: true
  end
end
