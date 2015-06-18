class AddMinChemicalSubstance < ActiveRecord::Migration
  def change
  	add_column :chemical_substances, :min, :float
  end
end
