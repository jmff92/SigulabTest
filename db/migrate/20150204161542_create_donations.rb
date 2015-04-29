class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.string :nombreItem
      t.string :marca
      t.string :modelo
      t.string :cantidad
      t.string :unidadMedida
      t.string :tipo

      t.timestamps
    end
  end
end
