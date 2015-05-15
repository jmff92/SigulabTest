class AddAttach < ActiveRecord::Migration
  def change
  	add_column :requisitions, :attachment, :string
  end
end
