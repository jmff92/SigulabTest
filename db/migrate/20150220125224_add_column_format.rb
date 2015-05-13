class AddColumnFormat < ActiveRecord::Migration
  def change
  	add_column :binnacles, :format, :string
  end
end
