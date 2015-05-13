class AddDocumentDateToProjexecutions < ActiveRecord::Migration
  def change
    add_column :projexecutions, :document_date, :date
  end
end
