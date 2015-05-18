class AddSpecidRequi < ActiveRecord::Migration
  def change
  	add_column :requisitions, :specification_id, :integer
  end
end

