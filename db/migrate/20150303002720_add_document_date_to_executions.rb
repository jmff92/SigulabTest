class AddDocumentDateToExecutions < ActiveRecord::Migration
  def change
    add_column :executions, :document_date, :date
  end
end
