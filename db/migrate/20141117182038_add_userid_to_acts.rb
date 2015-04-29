class AddUseridToActs < ActiveRecord::Migration
  def change
	add_column :acts, :user_id, :string
  end
end
