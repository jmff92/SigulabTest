json.array!(@specifications) do |specification|
  json.extract! specification, :id
  json.url specification_url(specification, format: :json)
end
