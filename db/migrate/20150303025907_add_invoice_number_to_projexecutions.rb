class AddInvoiceNumberToProjexecutions < ActiveRecord::Migration
  def change
    add_column :projexecutions, :invoice_number, :string
  end
end
