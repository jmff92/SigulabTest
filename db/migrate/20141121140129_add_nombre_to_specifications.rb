class AddNombreToSpecifications < ActiveRecord::Migration
  def change
  	add_column :specifications, :nombre, :string
  end
end
