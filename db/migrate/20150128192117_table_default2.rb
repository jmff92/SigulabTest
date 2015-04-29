class TableDefault2 < ActiveRecord::Migration
  def change
  	change_column :equipment, :solicitado, :boolean, :default => false
  	change_column :instruments, :solicitado, :boolean, :default => false
  	change_column :consumables, :solicitado, :boolean, :default => false
  	change_column :chemical_substances, :solicitado, :boolean, :default => false
  	change_column :tools, :solicitado, :boolean, :default => false
  end
end