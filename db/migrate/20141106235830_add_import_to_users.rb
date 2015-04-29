class AddImportToUsers < ActiveRecord::Migration
  def change
    add_column :users, :import, :boolean
  end
end
