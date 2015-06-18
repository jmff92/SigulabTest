class CamposDonacionesRubrosCambiar < ActiveRecord::Migration
  def change
  	remove_column :equipment, :NumDonacion
  	remove_column :instruments, :NumDonacion
  	remove_column :tools, :NumDonacion
  	remove_column :consumables, :NumDonacion
  	add_column :equipment, :numDonacion, :integer
  	add_column :instruments, :numDonacion, :integer
  	add_column :tools, :numDonacion, :integer
  	add_column :consumables, :numDonacion, :integer
  	remove_column :equipment, :PJDonacion
  	remove_column :instruments, :PJDonacion
  	remove_column :tools, :PJDonacion
  	remove_column :consumables, :PJDonacion
  	add_column :equipment, :pJDonacion, :string
  	add_column :instruments, :pJDonacion, :string
  	add_column :tools, :pJDonacion, :string
  	add_column :consumables, :pJDonacion, :string
  	remove_column :equipment, :PersonaContactoDonacion
  	remove_column :instruments, :PersonaContactoDonacion
  	remove_column :tools, :PersonaContactoDonacion
  	remove_column :consumables, :PersonaContactoDonacion
  	add_column :equipment, :personaContactoDonacion, :string
  	add_column :instruments, :personaContactoDonacion, :string
  	add_column :tools, :personaContactoDonacion, :string
  	add_column :consumables, :personaContactoDonacion, :string
  end
end
