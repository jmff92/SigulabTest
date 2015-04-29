class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :name
      t.string :brand
      t.string :model
      t.string :serial
      t.integer :national_good
      t.string :status
      t.date :last_calibration
      t.text :use
      t.string :responsible
      t.string :location
      t.date :adquisition_date
      t.string :buy_order
      t.float :cost
      t.string :bill
      t.boolean :investigation
      t.boolean :teaching
      t.boolean :extention
      t.boolean :management
      t.string :calibrated

      t.timestamps
    end
  end
end
