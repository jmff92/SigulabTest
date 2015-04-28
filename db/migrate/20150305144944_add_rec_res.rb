class AddRecRes < ActiveRecord::Migration
  def change
  	add_column :recommendations, :responsale, :string
  end
end
