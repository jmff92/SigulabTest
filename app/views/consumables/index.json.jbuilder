json.array!(@consumables) do |consumable|
  json.extract! consumable, :id, :name, :description, :material, :quantity, :location, :use, :responsible, :investigation, :teaching, :extention, :management
  json.url consumable_url(consumable, format: :json)
end
