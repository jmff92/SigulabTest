class ModifyCheckProjexecution < ActiveRecord::Migration
  def change
  	change_column :projexecutions, :check_annulled, :boolean, :default => false
  end
end
