class CreateProjincomes < ActiveRecord::Migration
  def change
    create_table :projincomes do |t|
      t.integer :proyecto
      t.string :sae_code
      t.integer :origin
      t.string :description
      t.float :amount
      t.string :concept
      t.integer :financing
      t.string :organism
      t.date :date
      t.string :document
      t.string :doc_code
      t.string :doc_url
      t.date :doc_date
      t.string :unit
      t.string :observations

      t.timestamps
    end
  end
end
