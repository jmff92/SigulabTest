class AddDoccodeToIncomes < ActiveRecord::Migration
  def change
    add_column :incomes, :doccode, :string
  end
end
