class AddFecha < ActiveRecord::Migration
  def change
    add_column :invitations, :fecha_tope, :string
  end
end
