class AddMoreAtributesLoans < ActiveRecord::Migration
  def change
  	add_column :loans, :finLunes, :time
  	add_column :loans, :finMartes, :time
  	add_column :loans, :finMiercoles, :time
  	add_column :loans, :finJueves, :time
  	add_column :loans, :finViernes, :time
  end
end
