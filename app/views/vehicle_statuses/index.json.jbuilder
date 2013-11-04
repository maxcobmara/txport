json.array!(@vehicle_statuses) do |vehicle_status|
  json.extract! vehicle_status, :short_name, :description
  json.url vehicle_status_url(vehicle_status, format: :json)
end
