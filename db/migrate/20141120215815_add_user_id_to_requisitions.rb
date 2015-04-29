class AddUserIdToRequisitions < ActiveRecord::Migration
  def change
  	add_column :requisitions, :user_id, :string
  end
end
