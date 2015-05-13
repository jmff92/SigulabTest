class AddInvoiceDateToExecutions < ActiveRecord::Migration
  def change
    add_column :executions, :invoice_date, :date
  end
end
