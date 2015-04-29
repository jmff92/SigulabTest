class AddQualityToUsers < ActiveRecord::Migration
  def change
    add_column :users, :quality, :boolean
  end
end
