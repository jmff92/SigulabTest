class AddCorreoItems < ActiveRecord::Migration
  def change
  	add_column :chemical_substances, :correo, :string
  	add_column :consumables, :correo, :string
  	add_column :equipment, :correo, :string
  	add_column :instruments, :correo, :string
  	add_column :tools, :correo, :string
  end
end
