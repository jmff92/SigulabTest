class CreateIdSustancia < ActiveRecord::Migration
  def change
    create_table :id_sustancia do |t|
      t.string :fecha
      t.string :consumo
      t.string :ingreso
      t.string :saldo

      t.timestamps
    end
  end
end
