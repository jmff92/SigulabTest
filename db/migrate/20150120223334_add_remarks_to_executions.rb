class AddRemarksToExecutions < ActiveRecord::Migration
  def change
    add_column :executions, :remarks, :string
  end
end
