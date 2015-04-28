class CreateProjcommitments < ActiveRecord::Migration
  def change
    create_table :projcommitments do |t|
      t.integer :proj_id
      t.string :code
      t.float :amount
      t.string :description
      t.string :recipient
      t.date :date
      t.text :observations
      t.integer :document

      t.timestamps
    end
  end
end
