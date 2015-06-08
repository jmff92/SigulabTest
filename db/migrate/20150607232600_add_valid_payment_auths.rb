class AddValidPaymentAuths < ActiveRecord::Migration
  def change
  	add_column :paymentauths, :valid_coord, :boolean
  	add_column :paymentauths, :valid_dir, :boolean
  	add_column :projpaymentauths, :valid, :boolean  	
  end
end
