class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :nombre
      t.string :attachment

      t.timestamps
    end
  end
end
