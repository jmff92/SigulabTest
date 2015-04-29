class AddObservaciones < ActiveRecord::Migration
  def change
  	add_column :relations, :observaciones, :string
  end
end
