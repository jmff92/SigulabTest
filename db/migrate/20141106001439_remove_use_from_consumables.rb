class RemoveUseFromConsumables < ActiveRecord::Migration
  def change
    remove_column :consumables, :use, :string
  end
end
