class AddDepthToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :depth, :decimal
  end
end
