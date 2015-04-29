class AddUnidadMedidaToLoans < ActiveRecord::Migration
  def change
  	add_column :loans, :unidadMedida, :string
  end
end
