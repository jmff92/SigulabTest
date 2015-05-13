class AddSpecificationId < ActiveRecord::Migration
  def change
  	add_column :relations, :specification_id, :integer
    add_column :requests, :specification_id, :integer
  end
end
