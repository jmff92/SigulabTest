class FinishFieldsOfExecution < ActiveRecord::Migration
  def change
    rename_column :executions, :amount, :check_amount
    add_column :executions, :check_number, :string
    add_column :executions, :check_elaboration_date, :datetime
    add_column :executions, :check_sign_date, :datetime
    add_column :executions, :check_delivery_date, :datetime
    add_column :executions, :check_delivery_status, :integer
  end
end
