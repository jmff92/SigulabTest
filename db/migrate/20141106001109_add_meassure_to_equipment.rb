class AddMeassureToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :meassure, :string
  end
end
