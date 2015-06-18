class CamposServicio < ActiveRecord::Migration
  def change
  	add_column :applications, :de, :string
  	add_column :applications, :personaContactoUnidadS, :string
  	add_column :applications, :telefono1, :string
  	add_column :applications, :telefono2, :string
  	add_column :applications, :companiaDepencia, :string
  	add_column :applications, :rif, :string
  	add_column :applications, :personaContactoCompania, :string
  	add_column :applications, :email1, :string
  	add_column :applications, :email2, :string
  	add_column :applications, :telefono3, :string
  	add_column :applications, :telefono4, :string
  	add_column :applications, :fechaCotizacion, :time
  	add_column :applications, :noCotizacion, :integer
  	add_column :applications, :montoTotalServicio, :integer
  	add_column :applications, :observacionesFinales, :string
  end
end
