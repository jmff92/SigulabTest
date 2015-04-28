class AddManageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :manage, :boolean
  end
end
