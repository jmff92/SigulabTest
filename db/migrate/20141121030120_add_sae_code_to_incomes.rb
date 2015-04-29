class AddSaeCodeToIncomes < ActiveRecord::Migration
  def change
    add_column :incomes, :sae_code, :string
  end
end
