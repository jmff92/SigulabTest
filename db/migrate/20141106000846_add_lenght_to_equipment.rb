class AddLenghtToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :lenght, :decimal
  end
end
