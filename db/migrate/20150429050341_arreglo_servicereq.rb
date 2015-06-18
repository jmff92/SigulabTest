class ArregloServicereq < ActiveRecord::Migration
  def change
  	remove_column :servicerequests, :tipo_servicio
  	remove_column :servicerequests, :lab_id
  	remove_column :servicerequests, :nombre
  	remove_column :servicerequests, :nro_bien
  	remove_column :servicerequests, :ubicacion
  	remove_column :servicerequests, :descripcion
  	remove_column :servicerequests, :compania
  	remove_column :servicerequests, :rif
  	remove_column :servicerequests, :contacto_ext
  	remove_column :servicerequests, :correo_ext
  	remove_column :servicerequests, :telefonos
  	remove_column :servicerequests, :nro_cotizacion
  	remove_column :servicerequests, :sae_code
  	remove_column :servicerequests, :partida
  end

  def change
	add_column :servicerequests, :fecha, :datetime
  end
end



