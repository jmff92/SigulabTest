class ChangeDeliveredId < ActiveRecord::Migration
  def change
  	change_column :paymentauths, :delivered_id, :string
  	change_column :projpaymentauths, :delivered_id, :string  	
  end
end
