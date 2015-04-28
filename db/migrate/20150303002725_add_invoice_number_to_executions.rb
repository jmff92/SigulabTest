class AddInvoiceNumberToExecutions < ActiveRecord::Migration
  def change
    add_column :executions, :invoice_number, :string
  end
end
