class RemoveDimentionsFromConsumables < ActiveRecord::Migration
  def change
    remove_column :consumables, :dimentions, :string
  end
end
