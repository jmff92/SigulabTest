class AddColumnCompraODonacion < ActiveRecord::Migration
  def change
  	add_column :consumables, :NumDonacion, :string
  	add_column :consumables, :FechaDonacion, :string
  	add_column :consumables, :PJDonacion, :string
  	add_column :consumables, :PersonaContactoDonacion, :string
  	add_column :equipment, :NumDonacion, :string
  	add_column :equipment, :FechaDonacion, :string
  	add_column :equipment, :PJDonacion, :string
  	add_column :equipment, :PersonaContactoDonacion, :string
  	add_column :instruments, :NumDonacion, :string
  	add_column :instruments, :FechaDonacion, :string
  	add_column :instruments, :PJDonacion, :string
  	add_column :instruments, :PersonaContactoDonacion, :string
  	add_column :tools, :NumDonacion, :string
  	add_column :tools, :FechaDonacion, :string
  	add_column :tools, :PJDonacion, :string
  	add_column :tools, :PersonaContactoDonacion, :string
  end
end
