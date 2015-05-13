class AddWidthToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :width, :decimal
  end
end
