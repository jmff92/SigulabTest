json.array!(@instruments) do |instrument|
  json.extract! instrument, :id, :name, :brand, :model, :measurement_unit, :capacity, :material, :use, :status, :location, :last_calibration, :responsible, :national_good, :investigation, :teaching, :extention, :management
  json.url instrument_url(instrument, format: :json)
end
