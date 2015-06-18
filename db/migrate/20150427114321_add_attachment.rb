class AddAttachment < ActiveRecord::Migration
  def change
  	add_column :requisitions, :attachment, :string
  end
end
