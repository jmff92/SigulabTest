class AddProjectAmountFields < ActiveRecord::Migration
  def change
    add_column :projects, :furniture, :float, default: 0
    add_column :projects, :other_desc, :string
    add_column :projects, :other_amount, :float, default: 0
  end
end
