class CreateDevolutions < ActiveRecord::Migration
  def change
    create_table :devolutions do |t|
      t.string :numRegistro
      t.string :numRequisicion
      t.boolean :requisicion
      t.string :numAutorizacion
      t.boolean :autorizacion
      t.string :numCertificacion
      t.boolean :certificacion
      t.string :numSolicitud
      t.boolean :solicitud
      t.string :numInforme
      t.boolean :informe
      t.string :numOtro
      t.boolean :otro
      t.boolean :disponibilidad
      t.boolean :idioma
      t.boolean :discriminado
      t.boolean :firma
      t.boolean :carencia
      t.boolean :nombre
      t.boolean :direccion
      t.boolean :datos
      t.boolean :rif
      t.boolean :telefonos
      t.boolean :persona
      t.boolean :otroCarencia
      t.boolean :contacto
      t.boolean :copia
      t.boolean :factura
      t.boolean :foto
      t.text :observaciones
      t.string :unidadSolicitante

      t.timestamps
    end
  end
end
