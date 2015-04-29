class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :nombreEmpresa
      t.string :direccion
      t.string :correo
      t.string :telefono
      t.string :telefonoAdicional
      t.string :responsable

      t.timestamps
    end
  end
end
