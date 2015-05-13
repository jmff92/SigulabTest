class CreatePaymentauths < ActiveRecord::Migration
  def change
    create_table :paymentauths do |t|
      t.string :recipient
      t.string :registry
      t.string :from
      t.date :elaboration_date
      t.date :delivery_date
      t.string :delivered_id
      t.string :concept
      t.float :amount
      t.string :observations
      t.string :recieved_by
      t.boolean :is_valid

      t.timestamps
    end
  end
end
