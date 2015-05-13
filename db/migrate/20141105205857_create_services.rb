class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :nombre
      t.string :numeroBien
      t.string :tipo
      t.text :descripcion
      t.string :ubicacion

      t.timestamps
    end
  end
end
