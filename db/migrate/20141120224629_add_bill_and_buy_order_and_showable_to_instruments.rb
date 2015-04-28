class AddBillAndBuyOrderAndShowableToInstruments < ActiveRecord::Migration
  def change
    add_column :instruments, :cost, :decimal
    add_column :instruments, :bill, :string
    add_column :instruments, :buy_order, :string
    add_column :instruments, :adquisition_date, :date
    add_column :instruments, :showable, :boolean, :default => true
  end
end
