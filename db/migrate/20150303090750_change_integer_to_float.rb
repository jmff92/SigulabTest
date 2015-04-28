class ChangeIntegerToFloat < ActiveRecord::Migration
  def change
  	 change_column :relations, :alto, :decimal
     change_column :relations, :ancho, :decimal
     change_column :relations, :largo, :decimal
     change_column :relations, :peso, :decimal
  end
end
