class ChangeCommitmentCode < ActiveRecord::Migration
  def change
  	change_column :commitments, :code, :string
  	change_column :projcommitments, :code, :string
  end
end
