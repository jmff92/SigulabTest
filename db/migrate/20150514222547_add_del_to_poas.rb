class AddDelToPoas < ActiveRecord::Migration
  def change
  	add_column :poas, :del, :boolean
  end
end
