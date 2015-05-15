json.array!(@services) do |service|
  json.extract! service, :id, :nombre, :descripcion, :numero
  json.url service_url(service, format: :json)
end
