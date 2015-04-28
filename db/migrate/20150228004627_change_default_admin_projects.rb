class ChangeDefaultAdminProjects < ActiveRecord::Migration
  def change
  	change_column_default(:projects, :admin, nil)
  end
end
