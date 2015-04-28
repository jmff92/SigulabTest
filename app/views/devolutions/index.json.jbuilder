json.array!(@devolutions) do |devolution|
  json.extract! devolution, :id, :numRegistro, :numRequisicion, :requisicion, :numAutorizacion, :autorizacion, :numCertificacion, :certificacion, :numSolicitud, :solicitud, :numInforme, :informe, :numOtro, :otro, :disponibilidad, :idioma, :discriminado, :firma, :carencia, :nombre, :direccion, :datos, :rif, :telefonos, :persona, :otroCarencia, :contacto, :copia, :factura, :foto, :observaciones, :unidadSolicitante
  json.url devolution_url(devolution, format: :json)
end
