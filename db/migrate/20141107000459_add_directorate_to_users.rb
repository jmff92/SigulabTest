class AddDirectorateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :directorate, :boolean
  end
end
