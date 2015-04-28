class AddColumnLoansTable < ActiveRecord::Migration
  def change
  	add_column :loans, :descripcion, :string
  	add_column :loans, :uso, :string
  end
end
