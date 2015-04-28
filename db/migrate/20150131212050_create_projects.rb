class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :project_number
      t.integer :contract
      t.string :title
      t.string :responsible
      t.string :admin
      t.string :sae_code
      t.integer :amount
      t.integer :equipments
      t.integer :services
      t.integer :infrastructure
      t.integer :hhrr
      t.integer :consumables
      t.date :incoming_date
      t.string :status

      t.timestamps
    end
  end
end
