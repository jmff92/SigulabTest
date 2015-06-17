json.array!(@binnacles) do |binnacle|
  json.extract! binnacle, :id, :idSustancia, :fecha, :consumo, :ingreso, :saldo
  json.url binnacle_url(binnacle, format: :json)
end