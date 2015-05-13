class ChangeAmountIntegerFloat < ActiveRecord::Migration
  def change
  	 change_column :projects, :amount, :float, default: 0
  end
end
