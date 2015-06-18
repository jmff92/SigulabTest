class ChangeUserProjPaymentAuth < ActiveRecord::Migration
  def change
  	remove_column :projpaymentauths, :user
  	add_column :projpaymentauths, :user_id, :integer
  end
end
