class AddDescriptionToLabs < ActiveRecord::Migration
  def change
    add_column :labs, :description, :string
  end
end
