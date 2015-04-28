class AddColumnLoans < ActiveRecord::Migration
  def change
  	add_column :loans, :esprestado, :boolean
  end
end
