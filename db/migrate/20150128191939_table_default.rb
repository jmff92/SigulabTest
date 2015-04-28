class TableDefault < ActiveRecord::Migration
  def change
  	change_column :equipment, :solicitado, :boolean, :default => true
  	change_column :instruments, :solicitado, :boolean, :default => true
  	change_column :consumables, :solicitado, :boolean, :default => true
  	change_column :chemical_substances, :solicitado, :boolean, :default => true
  	change_column :tools, :solicitado, :boolean, :default => true
  end
end