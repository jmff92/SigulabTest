class AddColumnBoolServicio < ActiveRecord::Migration
  def change
  	add_column :equipment, :solicitados, :boolean
  	add_column :instruments, :solicitados, :boolean
  	add_column :consumables, :solicitados, :boolean
  	add_column :chemical_substances, :solicitados, :boolean
  	add_column :tools, :solicitados, :boolean
  end
end
