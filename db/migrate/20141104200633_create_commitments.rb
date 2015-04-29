class CreateCommitments < ActiveRecord::Migration
  def change
    create_table :commitments do |t|
      #Required on integration #!
      #t.references :commitable, polymorphic: true
      
      t.references :lab
      
      t.string :code
      t.float :amount
      t.string :description
      t.string :recipient
      t.datetime :date

      t.timestamps
    end
  end
end
