class FechadonacionEquipment < ActiveRecord::Migration
  def change
  	remove_column :equipment, :FechaDonacion
  	add_column :equipment, :fechaDonacion, :date
  end
end
