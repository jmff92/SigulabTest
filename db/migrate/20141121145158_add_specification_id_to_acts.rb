class AddSpecificationIdToActs < ActiveRecord::Migration
  def change
  	add_column :acts, :specification_id, :string
  end
end
