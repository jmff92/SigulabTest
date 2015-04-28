class AddTechnicianToUser < ActiveRecord::Migration
  def change
    add_column :users, :technician, :boolean
  end
end
