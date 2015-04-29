class AddDocDateToIncomes < ActiveRecord::Migration
  def change
    add_column :incomes, :doc_date, :date
  end
end
