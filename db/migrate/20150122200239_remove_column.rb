class RemoveColumn < ActiveRecord::Migration
  def change
  	remove_column :loans, :solicitado
  	remove_column :applications, :solicitado
  end
end
