class AddManageAnalistToUsers < ActiveRecord::Migration
  def change
    add_column :users, :manage_analist, :boolean
  end
end
