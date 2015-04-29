class ChangeAdminProject < ActiveRecord::Migration
  def self.up
    remove_column :projects, :admin
    remove_column :projects, :status
    change_column :projects, :amount, :integer, default: 0
    change_column :projects, :equipments, :integer, default: 0
    change_column :projects, :services, :integer, default: 0
    change_column :projects, :infrastructure, :integer, default: 0
    change_column :projects, :hhrr, :integer, default: 0
    change_column :projects, :consumables, :integer, default: 0
  end


end
