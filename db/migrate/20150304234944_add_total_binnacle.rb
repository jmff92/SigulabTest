class AddTotalBinnacle < ActiveRecord::Migration
  def change
  	add_column :binnacles, :total, :integer
  end
end
