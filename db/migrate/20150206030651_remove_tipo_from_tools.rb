class RemoveTipoFromTools < ActiveRecord::Migration
  def change
  	remove_column :tools, :type, :string
  	add_column :tools, :tipo, :string
  end
end
