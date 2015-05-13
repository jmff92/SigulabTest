class AddShowableToConsumables < ActiveRecord::Migration
  def change
    add_column :consumables, :showable, :boolean, :default => true
  end
end
