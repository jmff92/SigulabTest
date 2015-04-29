class AddRelations < ActiveRecord::Migration
  def change
    add_column :relations, :alto, :integer
    add_column :relations, :ancho, :integer
    add_column :relations, :largo, :integer
    add_column :relations, :peso, :integer
    add_column :relations, :dimensiones_alto, :string
    add_column :relations, :dimensiones_ancho, :string
    add_column :relations, :dimensiones_largo, :string
    add_column :relations, :dimensiones_peso, :string
  end
end
