json.array!(@vehicle_fine_types) do |vehicle_fine_type|
  json.extract! vehicle_fine_type, :short_name, :description
  json.url vehicle_fine_type_url(vehicle_fine_type, format: :json)
end
