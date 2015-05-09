json.array!(@quotes) do |quote|
  json.extract! quote, :id, :nombre, :attachment
  json.url quote_url(quote, format: :json)
end
