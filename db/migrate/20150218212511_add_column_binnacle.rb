class AddColumnBinnacle < ActiveRecord::Migration
  def change
  	add_column :binnacles, :medidaConsumo, :string
  	add_column :binnacles, :medidaIngreso, :string
  	add_column :binnacles, :medidaSaldo, :string
  end
end
