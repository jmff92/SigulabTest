class ChangeDatesFormatInExecutions < ActiveRecord::Migration
 def change
    change_column :checks, :elaboration_date, :date
    change_column :executions, :check_elaboration_date, :date
    change_column :executions, :check_sign_date, :date
    change_column :executions, :check_delivery_date, :date
  end
end
