class AddNumeroBienItem < ActiveRecord::Migration
  def change
  		add_column :items, :numeroBien, :string
  end
end
