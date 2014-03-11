json.array!(@maintenance_types) do |maintenance_type|
  json.extract! maintenance_type, :type_name, :description
  json.url maintenance_type_url(maintenance_type, format: :json)
end
