class AddColumnDonations < ActiveRecord::Migration
  def change
  	add_column :donations, :estimado, :integer
  	add_column :donations, :numDocumento, :string
  	add_column :donations, :fechaDocumento, :date
  end
end
