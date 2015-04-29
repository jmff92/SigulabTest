class ChangeBinnacle < ActiveRecord::Migration
  def change
  	remove_column :binnacles, :consumo, :string
  	remove_column :binnacles, :ingreso, :string
  	remove_column :binnacles, :saldo, :string
  	add_column :binnacles, :consumo, :integer, default: 0
  	add_column :binnacles, :ingreso, :integer, default: 0
  	add_column :binnacles, :saldo, :integer, default: 0
  end
end
