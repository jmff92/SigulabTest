class AddLabBossToUser < ActiveRecord::Migration
  def change
    add_column :users, :labBoss, :boolean
  end
end
