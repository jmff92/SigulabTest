class AddAcquisitionAnalistToUsers < ActiveRecord::Migration
  def change
    add_column :users, :acquisition_analist, :boolean
  end
end
