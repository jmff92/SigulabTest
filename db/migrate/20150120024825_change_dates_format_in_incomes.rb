class ChangeDatesFormatInIncomes < ActiveRecord::Migration
 def change
    change_column :incomes, :date, :date
  end
end
