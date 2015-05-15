class AddAdminprojToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :projadmin, :boolean
  end
end
