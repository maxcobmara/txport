json.array!(@vehicle_categories) do |vehicle_category|
  json.extract! vehicle_category, :short_name, :description
  json.url vehicle_category_url(vehicle_category, format: :json)
end
