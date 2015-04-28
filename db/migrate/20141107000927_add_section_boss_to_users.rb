class AddSectionBossToUsers < ActiveRecord::Migration
  def change
    add_column :users, :section_boss, :boolean
  end
end
