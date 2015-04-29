class AddDocumentNameToExecutions < ActiveRecord::Migration
  def change
    add_column :executions, :document_name, :string
  end
end
