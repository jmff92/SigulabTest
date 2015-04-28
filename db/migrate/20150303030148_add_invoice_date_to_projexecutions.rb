class AddInvoiceDateToProjexecutions < ActiveRecord::Migration
  def change
    add_column :projexecutions, :invoice_date, :date
  end
end
