class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.references :execution, index: true
      
      t.string :check_number
      t.float :amount
      t.datetime :elaboration_date
      t.datetime :sign_date
      t.datetime :delivery_date

      t.timestamps
    end
  end
end
