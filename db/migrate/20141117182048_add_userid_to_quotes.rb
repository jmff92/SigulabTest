class AddUseridToQuotes < ActiveRecord::Migration
  def change
	add_column :quotes, :user_id, :string
  end
end
