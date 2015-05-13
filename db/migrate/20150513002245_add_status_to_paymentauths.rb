class AddStatusToPaymentauths < ActiveRecord::Migration
  def change
	add_column :paymentauths, :status, :string
	add_column :paymentauths, :user, :string
	add_column :projpaymentauths, :status, :string
	add_column :projpaymentauths, :user, :string
  end
end
