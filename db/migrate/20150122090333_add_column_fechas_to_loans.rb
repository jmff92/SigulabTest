class AddColumnFechasToLoans < ActiveRecord::Migration
  def change
  	add_column :loans, :fechaEntrega, :date
  	add_column :loans, :fechaTope, :date
  end
end
