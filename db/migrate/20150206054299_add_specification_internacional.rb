class AddSpecificationInternacional < ActiveRecord::Migration
  def change
    add_column :specifications, :nacional, :string, unique: true
    add_column :specifications, :p8, :int, unique: true
    add_column :specifications, :p9, :int, unique: true
    add_column :specifications, :modalidad, :string, unique: true
    
  end
end