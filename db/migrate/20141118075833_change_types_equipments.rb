class ChangeTypesEquipments < ActiveRecord::Migration
  def change
    remove_column :equipment, :cost, :float
    remove_column :equipment, :lenght, :decimal
    remove_column :equipment, :depth, :decimal
    remove_column :equipment, :width, :decimal
    remove_column :equipment, :meassure, :string
    add_column :equipment, :cost, :decimal
    add_column :equipment, :length, :float
    add_column :equipment, :depth, :float
    add_column :equipment, :width, :float
    add_column :equipment, :measurelength, :string
    add_column :equipment, :measuredepth, :string
    add_column :equipment, :measurewidth, :string
    add_column :equipment, :showable, :boolean, :default => true
  end
end
