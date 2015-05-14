class ChangeValidNames < ActiveRecord::Migration
  def change
	remove_column :projects, :valid
	remove_column :projcommitments, :valid
	remove_column :projexecutions, :valid
	add_column :projects, :valid_res, :boolean, default: false
	add_column :projcommitments, :valid_res, :boolean, default: false
	add_column :projexecutions, :valid_res, :boolean, default: false
  end
end
