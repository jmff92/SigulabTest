json.array!(@items) do |item|
  json.extract! item, :id, :nombre, :descripcion, :dimensiones_largo, :dimensiones_ancho, :dimensiones_alto, :cantidad, :unidad
  json.url item_url(item, format: :json)
end
