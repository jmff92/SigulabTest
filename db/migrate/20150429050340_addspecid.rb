class Addspecid < ActiveRecord::Migration
  def change
  	add_column :servicerequests, :specification_id, :integer
  end
end
