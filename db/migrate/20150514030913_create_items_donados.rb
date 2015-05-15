class CreateItemsDonados < ActiveRecord::Migration
  def change
    create_table :item_donados do |t|
      t.string :Nombre
      t.string :Marca
      t.string :Modelo
      t.string :UniDeMedida
      t.string :tipo
      t.string :NoDonacion

      t.timestamps
    end
  end
end
