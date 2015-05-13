class AddValidToIncomes < ActiveRecord::Migration
  def change
	add_column :incomes, :valid_adm, :boolean, default: false
	add_column :incomes, :valid_dir, :boolean, default: false
	add_column :executions, :valid_adm, :boolean, default: false
	add_column :executions, :valid_dir, :boolean, default: false
  end
end
