class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :fecha
      t.string :nos
      t.string :tipoServicio
      t.string :descripcion
      t.string :fechaini
      t.string :fechafin
      t.string :observaciones

      t.timestamps
    end
  end
end
