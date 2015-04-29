class AddObservationsToCommitments < ActiveRecord::Migration
  def change
    add_column :commitments, :observations, :text
  end
end
