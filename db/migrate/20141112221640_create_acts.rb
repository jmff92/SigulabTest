class CreateActs < ActiveRecord::Migration
  def change
    create_table :acts do |t|
      t.string :numRegistro
      t.string :proveedor
      t.string :bienServicio
      t.string :tesis
      t.string :responsable
      t.string :justificacion
      t.string :providencia

      t.timestamps
    end
  end
end
