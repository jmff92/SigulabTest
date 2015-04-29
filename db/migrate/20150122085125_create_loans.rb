class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.string :fechaEntrega
      t.string :ubicacion
      t.string :fechaTope
      t.string :condiciones
      t.string :medida

      t.timestamps
    end
  end
end
