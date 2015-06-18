class AddMeassureMin < ActiveRecord::Migration
  def change
  	add_column :chemical_substances, :meassureMin, :string
  end
end
