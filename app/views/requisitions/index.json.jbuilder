json.array!(@requisitions) do |requisition|
  json.extract! requisition, :id, :solicitante, :consumidor, :partida, :autor, :observacion
  json.url requisition_url(requisition, format: :json)
end
