class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :nombre
      t.string :tipo
      t.text :descripcion
      t.string :dimensiones
      t.integer :cantidad
      t.string :unidad

      t.timestamps
    end
  end
end
