class MigracionesRubros < ActiveRecord::Migration
  def change
  	remove_column :instruments, :FechaDonacion
  	remove_column :tools, :FechaDonacion
  	remove_column :consumables, :FechaDonacion
  	add_column :instruments, :fechaDonacion, :date
  	add_column :tools, :fechaDonacion, :date
  	add_column :consumables, :fechaDonacion, :date
  end
end
