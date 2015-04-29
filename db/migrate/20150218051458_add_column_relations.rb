class AddColumnRelations < ActiveRecord::Migration
  def change
    remove_column :relations, :tipo, :string
    add_column :relations, :equipo, :string
    add_column :relations, :material_consumible, :string
    add_column :relations, :servicio, :string
    add_column :relations, :licencia, :string
    add_column :relations, :repuesto, :string
    add_column :relations, :renovacion_licencia, :string
    add_column :relations, :accesorio, :string
    add_column :relations, :otro, :string
  end
end
