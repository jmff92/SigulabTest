class ChangeInvitations < ActiveRecord::Migration
  def change
    remove_column :invitations, :international, :integer
    add_column :invitations, :contacto, :string
    add_column :invitations, :correo_contacto, :string
    add_column :items, :comprar, :integer
  end
end
