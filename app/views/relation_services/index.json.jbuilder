json.array!(@relation_services) do |relation_service|
  json.extract! relation_service, :id, :servicio, :item
  json.url relation_service_url(relation_service, format: :json)
end
