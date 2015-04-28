class CreateConsumables < ActiveRecord::Migration
  def change
    create_table :consumables do |t|
      t.string :name
      t.string :description
      t.string :dimentions
      t.string :material
      t.string :quantity
      t.string :location
      t.string :use
      t.string :responsible
      t.boolean :investigation
      t.boolean :teaching
      t.boolean :extention
      t.boolean :management

      t.timestamps
    end
  end
end
