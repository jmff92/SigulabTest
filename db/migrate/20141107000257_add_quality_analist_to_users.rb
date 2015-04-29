class AddQualityAnalistToUsers < ActiveRecord::Migration
  def change
    add_column :users, :quality_analist, :boolean
  end
end
