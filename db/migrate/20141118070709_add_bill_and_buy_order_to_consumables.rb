class AddBillAndBuyOrderToConsumables < ActiveRecord::Migration
  def change
    add_column :consumables, :cost, :decimal
    add_column :consumables, :bill, :string
    add_column :consumables, :buy_order, :string
    add_column :consumables, :adquisition_date, :date
  end
end
