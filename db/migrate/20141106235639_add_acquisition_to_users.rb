class AddAcquisitionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :acquisition, :boolean
  end
end
