class AddForgeinKeyRecords < ActiveRecord::Migration
  def change
  	add_column :records, :idEquipo, :string
  end
end
