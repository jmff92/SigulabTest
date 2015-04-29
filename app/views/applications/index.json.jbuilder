json.array!(@applications) do |application|
  json.extract! application, :id, :fechaRequerida, :descripcion, :uso
  json.url application_url(application, format: :json)
end
