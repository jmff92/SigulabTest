class AddSubstituteProjects < ActiveRecord::Migration
  def change
    add_column :projects, :substitute, :string
  end
end
