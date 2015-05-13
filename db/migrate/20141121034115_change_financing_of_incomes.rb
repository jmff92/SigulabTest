class ChangeFinancingOfIncomes < ActiveRecord::Migration
  def up
    remove_column :incomes, :financing
    add_column :incomes, :financing, :integer, default: 0
  end
  
  def down
    remove_column :incomes, :financing
    add_column :incomes, :financing, :string
  end
end
