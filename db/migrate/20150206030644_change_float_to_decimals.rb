class ChangeFloatToDecimals < ActiveRecord::Migration
  def change
    change_column :projects, :equipments, :decimal, default: 0
    change_column :projects, :services, :decimal, default: 0
    change_column :projects, :hhrr, :decimal, default: 0
    change_column :projects, :consumables, :decimal, default: 0
    change_column :projects, :infrastructure, :decimal, default: 0
    change_column :projects, :other_amount, :decimal, default: 0
    change_column :projects, :amount, :decimal, default: 0
  end
end
