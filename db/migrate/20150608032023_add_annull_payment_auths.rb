class AddAnnullPaymentAuths < ActiveRecord::Migration
  def change
  	add_column :paymentauths, :annull, :boolean
  end
end
