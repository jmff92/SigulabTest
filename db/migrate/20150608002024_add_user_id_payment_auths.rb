class AddUserIdPaymentAuths < ActiveRecord::Migration
  def change
  	add_column :paymentauths, :user_id, :integer
  end
end
