class ChangeDatesFormatInCommitments < ActiveRecord::Migration
 def change
    change_column :commitments, :date, :date
    change_column :checks, :created_at, :datetime
    change_column :checks, :updated_at, :datetime
  end
end
