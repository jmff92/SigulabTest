class RemoveTelAdAddFax < ActiveRecord::Migration
  def change
  	remove_column :invitations, :telefono_Adicional
        add_column :invitations, :numero_fax, :string
  end
end
