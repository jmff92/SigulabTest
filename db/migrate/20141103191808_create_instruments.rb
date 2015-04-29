class CreateInstruments < ActiveRecord::Migration
  def change
    create_table :instruments do |t|
      t.string :name
      t.string :brand
      t.string :model
      t.string :measurement_unit
      t.float :capacity
      t.string :material
      t.string :use
      t.string :status
      t.string :location
      t.date :last_calibration
      t.string :responsible
      t.integer :national_good
      t.boolean :investigation
      t.boolean :teaching
      t.boolean :extention
      t.boolean :management

      t.timestamps
    end
  end
end
