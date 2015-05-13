class CreateBinnacles < ActiveRecord::Migration
  def change
    create_table :binnacles do |t|
      t.string :idSustancia
      t.date   :fecha
      t.string :consumo
      t.string :ingreso
      t.string :saldo

      t.timestamps
    end
  end
end
