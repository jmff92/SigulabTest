class AddDependencyToAllInventario < ActiveRecord::Migration
  def change
    add_column :equipment, :dependency, :string
    add_column :chemical_substances, :dependency, :string
    add_column :consumables, :dependency, :string
    add_column :instruments, :dependency, :string
    add_column :tools, :dependency, :string
  end
end
