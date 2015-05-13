class CreateRequisitions < ActiveRecord::Migration
  def change
    create_table :requisitions do |t|
      t.string :solicitante
      t.string :consumidor
      t.string :partida
      t.string :autor
      t.text :observacion

      t.timestamps
    end
  end
end
