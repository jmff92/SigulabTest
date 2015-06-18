class ChangeValidProjPaymentAuths < ActiveRecord::Migration
  def change
  	remove_column :projpaymentauths, :valid
  	add_column :projpaymentauths, :valid_adm, :boolean  	
  end
end
