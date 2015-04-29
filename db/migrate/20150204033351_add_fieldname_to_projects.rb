class AddFieldnameToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :num_cuenta, :string
  end
end
