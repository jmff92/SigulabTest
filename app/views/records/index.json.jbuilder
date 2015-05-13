json.array!(@records) do |record|
  json.extract! record, :id, :fecha, :nos, :tipoServicio, :descripcion, :fechaini, :fechafin, :observaciones
  json.url record_url(record, format: :json)
end
