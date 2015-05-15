class ChangeColumnLoans < ActiveRecord::Migration
  def change
  	change_column :loans, :inicio, :string
  	change_column :loans, :hasta, :string
  	change_column :loans, :maxDevolucion, :string
  end
end
