class AddColumnOrigenInventario < ActiveRecord::Migration
  def change
  	add_column :equipment, :origen, :string
  	add_column :chemical_substances, :origen, :string
  	add_column :consumables, :origen, :string
  	add_column :tools, :origen, :string
  	add_column :instruments, :origen, :string
  end
end
