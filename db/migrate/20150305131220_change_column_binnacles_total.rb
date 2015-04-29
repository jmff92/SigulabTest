class ChangeColumnBinnaclesTotal < ActiveRecord::Migration
  def change
  	change_column :binnacles, :total, :float, default: 0.00
  end
end
