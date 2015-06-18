class RemoveFromLoans < ActiveRecord::Migration
  def change
  	remove_column :loans, :desde
  	remove_column :loans, :fechaEntrega
  	add_column :loans, :inicio, :date
  	add_column :loans, :hasta, :date
  end
end
