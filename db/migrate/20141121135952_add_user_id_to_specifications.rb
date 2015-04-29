class AddUserIdToSpecifications < ActiveRecord::Migration
  def change
  	add_column :specifications, :user_id, :string
  end
end
