class RemoveColumnFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :usbid, :string
  end
end
