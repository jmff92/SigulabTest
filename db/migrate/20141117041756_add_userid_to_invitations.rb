class AddUseridToInvitations < ActiveRecord::Migration
  def change
	add_column :invitations, :user_id, :string
  end
end
