class EstimadoDonacion < ActiveRecord::Migration
  def change
  	change_column :donations, :estimado, :float, default: 0
  end
end
