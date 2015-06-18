class MigracionesDonacion < ActiveRecord::Migration
  def change
  	remove_column :instruments, :NumDonacion
  	remove_column :equipment, :NumDonacion
  	remove_column :consumables, :NumDonacion
  	remove_column :tools, :NumDonacion
  	remove_column :instruments, :FechaDonacion
  	remove_column :consumables, :FechaDonacion
  	remove_column :tools, :FechaDonacion
  	add_column :instruments, :FechaDonacion, :date
  	add_column :tools, :FechaDonacion, :date
  	add_column :consumables, :FechaDonacion, :date
  	add_column :instruments, :NumDonacion, :integer
  	add_column :equipment, :NumDonacion, :integer
  	add_column :consumables, :NumDonacion, :integer
  	add_column :tools, :NumDonacion, :integer
  end
end
