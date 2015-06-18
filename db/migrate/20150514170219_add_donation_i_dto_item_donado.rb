class AddDonationIDtoItemDonado < ActiveRecord::Migration
  def change
  	add_column :item_donados, :donation_id, :integer
  end
end
