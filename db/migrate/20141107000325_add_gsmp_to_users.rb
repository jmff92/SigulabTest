class AddGsmpToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gsmp, :boolean
  end
end
