class RemoveTable < ActiveRecord::Migration
  def change
  	drop_table :id_sustancia
  end
end
