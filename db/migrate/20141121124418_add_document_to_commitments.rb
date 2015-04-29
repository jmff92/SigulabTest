class AddDocumentToCommitments < ActiveRecord::Migration
  def change
    add_column :commitments, :document, :integer, default: 0
  end
end
