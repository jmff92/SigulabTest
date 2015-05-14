class ChangeFromPaymentauths < ActiveRecord::Migration
  def change
  	remove_column :paymentauths, :from
  	add_column :paymentauths, :from, :integer
  end
end
