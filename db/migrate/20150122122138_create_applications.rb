class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :fechaRequerida
      t.string :descripcion
      t.string :uso

      t.timestamps
    end
  end
end
