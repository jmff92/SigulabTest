class AddDocCodeToIncomes < ActiveRecord::Migration
  def change
    add_column :incomes, :doc_code, :string
  end
end
