class AddMaxDevolucionLoans < ActiveRecord::Migration
  def change
  	add_column :loans, :maxDevolucion, :time
  end
end
