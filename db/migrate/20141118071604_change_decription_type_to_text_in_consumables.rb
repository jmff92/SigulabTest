class ChangeDecriptionTypeToTextInConsumables < ActiveRecord::Migration
  def change
    remove_column :consumables, :description
    add_column :consumables, :description, :text
  end
end
