class AddAdminProject < ActiveRecord::Migration
  def change
    add_column :projects, :admin, :integer, default: 0
    add_column :projects, :status, :integer, default: 0
  end
end
