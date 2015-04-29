json.array!(@tools) do |tool|
  json.extract! tool, :id, :name, :brand, :type, :national_good, :status, :use, :responsible, :location, :material, :bill, :from_set, :investigation, :teaching, :extention, :management
  json.url tool_url(tool, format: :json)
end
