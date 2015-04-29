class ChangeAmountsIntegerFloat < ActiveRecord::Migration
  def change
  	change_column :projects, :equipments, :float, default: 0
  	change_column :projects, :services, :float, default: 0  	
  	change_column :projects, :hhrr, :float, default: 0  	
  	change_column :projects, :consumables, :float, default: 0  	
  	change_column :projects, :infrastructure, :float, default: 0  	
  end
end
