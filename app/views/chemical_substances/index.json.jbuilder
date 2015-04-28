json.array!(@chemical_substances) do |chemical_substance|
  json.extract! chemical_substance, :id, :name, :purity, :matter_states, :controlled, :legal_regime, :quantity, :cas, :use, :status, :responsible, :location, :expiration_date, :dangerous, :rI7, :rI4, :toxic, :oxidant, :explosive, :irritating, :inflamable, :corrosive, :nocive, :investigation, :teaching, :extention, :management
  json.url chemical_substance_url(chemical_substance, format: :json)
end
