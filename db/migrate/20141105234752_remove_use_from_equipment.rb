class RemoveUseFromEquipment < ActiveRecord::Migration
  def change
    remove_column :equipment, :use, :text
  end
end
