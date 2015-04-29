class ChangeDatesFormatInChecks2 < ActiveRecord::Migration
 def change
    change_column :checks, :created_at, :date
    change_column :checks, :updated_at, :date
    change_column :checks, :sign_date, :date
    change_column :checks, :delivery_date, :date
  end
end
