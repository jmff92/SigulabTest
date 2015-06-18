class AddId2Service < ActiveRecord::Migration
  def change
  	add_column :services, :idItem, :string
  end
end
