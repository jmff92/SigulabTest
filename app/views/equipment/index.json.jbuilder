json.array!(@equipment) do |equipment|
  json.extract! equipment, :id, :name, :brand, :model, :serial, :national_good, :status, :last_calibration, :use, :responsible, :location, :adquisition_date, :buy_order, :cost, :bill, :investigation, :teaching, :extention, :management, :calibrated
  json.url equipment_url(equipment, format: :json)
end
