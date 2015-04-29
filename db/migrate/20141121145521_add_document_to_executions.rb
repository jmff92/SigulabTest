class AddDocumentToExecutions < ActiveRecord::Migration
  def change
    add_column :executions, :document, :integer, default: 0
  end
end
