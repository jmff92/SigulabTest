class AddShowableandRemoveManagementFromChemicalSubstances < ActiveRecord::Migration
  def change
    add_column :chemical_substances, :showable, :boolean, :default => true
    remove_column :chemical_substances, :management, :boolean

  end
end
