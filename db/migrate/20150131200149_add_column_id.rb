class AddColumnId < ActiveRecord::Migration
  def change
  	add_column :equipment, :id2, :string
  	add_column :instruments, :id2, :string
  	add_column :consumables, :id2, :string
  	add_column :chemical_substances, :id2, :string
  	add_column :tools, :id2, :string
  	remove_column :equipment, :solicitado
  	remove_column :instruments, :solicitado
  	remove_column :consumables, :solicitado
  	remove_column :chemical_substances, :solicitado
  	remove_column :tools, :solicitado
  end
end
