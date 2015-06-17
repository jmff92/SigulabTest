class ChangeUseOfActs< ActiveRecord::Migration
  def change
	remove_column :acts, :tesis
  	add_column :acts, :docencia, :integer
  	add_column :acts, :investigacion, :integer
  	add_column :acts, :extension, :integer
  	add_column :acts, :apoyo, :integer

  end
end
