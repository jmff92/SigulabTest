class AddValidToProjects < ActiveRecord::Migration
  def change
	add_column :projects, :valid, :boolean, default: false
	add_column :projcommitments, :valid, :boolean, default: false
	add_column :projexecutions, :valid, :boolean, default: false
  end
end
