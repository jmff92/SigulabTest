class AddColumn < ActiveRecord::Migration
  def change
  	add_column :equipment, :solicitado, :boolean
  	add_column :instruments, :solicitado, :boolean
  	add_column :consumables, :solicitado, :boolean
  	add_column :chemical_substances, :solicitado, :boolean
  	add_column :tools, :solicitado, :boolean
  end
end
