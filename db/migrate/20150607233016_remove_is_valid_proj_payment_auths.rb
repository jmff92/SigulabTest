class RemoveIsValidProjPaymentAuths < ActiveRecord::Migration
  def change
  	remove_column :projpaymentauths, :is_valid
  end
end
