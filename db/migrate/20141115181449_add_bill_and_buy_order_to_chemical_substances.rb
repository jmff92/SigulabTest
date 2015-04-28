class AddBillAndBuyOrderToChemicalSubstances < ActiveRecord::Migration
  def change
    add_column :chemical_substances, :cost, :decimal
    add_column :chemical_substances, :bill, :string
    add_column :chemical_substances, :buy_order, :string
    add_column :chemical_substances, :adquisition_date, :date
  end
end
