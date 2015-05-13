class ChangeColumn < ActiveRecord::Migration
  def change
  	change_column :loans, :solicitado, :boolean, :default => false
  	change_column :applications, :solicitado, :boolean, :default => false
  end
end
