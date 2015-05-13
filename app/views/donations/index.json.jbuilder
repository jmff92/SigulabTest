json.array!(@donations) do |donation|
  json.extract! donation, :id, :nombreItem, :marca, :modelo, :cantidad, :unidadMedida, :tipo
  json.url donation_url(donation, format: :json)
end
