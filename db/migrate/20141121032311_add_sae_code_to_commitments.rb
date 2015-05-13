class AddSaeCodeToCommitments < ActiveRecord::Migration
  def change
    add_column :commitments, :sae_code, :string
  end
end
