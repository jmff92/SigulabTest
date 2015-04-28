class RemoveFechasFromLoans < ActiveRecord::Migration
  def change
  	remove_column :loans, :fechaEntrega, :string
  	remove_column :loans, :fechaTope, :string
  end
end
