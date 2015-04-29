class AddForeingEquipment < ActiveRecord::Migration
  def change
  	add_column :equipment, :numSolicitud, :integer
  end
end
