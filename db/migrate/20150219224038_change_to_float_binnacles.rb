class ChangeToFloatBinnacles < ActiveRecord::Migration
  def change
  	change_column :binnacles, :ingreso, :float, default: 0.0
  	change_column :binnacles, :consumo, :float, default: 0.0
  	remove_column :binnacles, :saldo
  	remove_column :binnacles, :medidaSaldo
  	add_column :binnacles, :descripcion, :string
  end
end
