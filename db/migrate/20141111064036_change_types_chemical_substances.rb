class ChangeTypesChemicalSubstances < ActiveRecord::Migration
  def change
    remove_column :chemical_substances, :purity
    remove_column :chemical_substances, :quantity
    add_column :chemical_substances, :purity, :float
    add_column :chemical_substances, :quantity, :float
  end
end