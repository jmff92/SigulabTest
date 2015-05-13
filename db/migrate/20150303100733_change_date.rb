class ChangeDate < ActiveRecord::Migration
  def change
  	remove_column :invitations, :fecha_tope
    add_column :invitations, :fecha_tope, :date
  end
end
