class AddUserIdToDevolutions < ActiveRecord::Migration
  def change
  	add_column :devolutions, :user_id, :string
  end
end
