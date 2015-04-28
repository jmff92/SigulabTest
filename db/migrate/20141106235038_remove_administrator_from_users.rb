class RemoveAdministratorFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :administrator, :boolean
  end
end
