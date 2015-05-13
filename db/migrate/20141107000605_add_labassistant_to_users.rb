class AddLabassistantToUsers < ActiveRecord::Migration
  def change
    add_column :users, :labassistant, :boolean
  end
end
