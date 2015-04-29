class AddUseridToServices < ActiveRecord::Migration
  def change
	add_column :services, :user_id, :string
  end
end
