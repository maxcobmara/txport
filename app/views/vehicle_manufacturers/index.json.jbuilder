json.array!(@vehicle_manufacturers) do |vehicle_manufacturer|
  json.extract! vehicle_manufacturer, :name, :country
  json.url vehicle_manufacturer_url(vehicle_manufacturer, format: :json)
end
