class CreateProjexecutions < ActiveRecord::Migration
  def change
    create_table :projexecutions do |t|
      t.integer :proyecto
      t.integer :commitment_id
      t.string :code
      t.float :check_amount
      t.date :date
      t.integer :document
      t.string :check_number
      t.date :check_elaboration_date
      t.date :check_sign_date
      t.date :check_delivery_date
      t.integer :check_delivery_status
      t.boolean :check_annulled
      t.string :remarks

      t.timestamps
    end
  end
end
