json.array!(@vehicle_nos) do |vehicle_no|
  json.extract! vehicle_no, :start_on, :end_on, :vehicle_id
  json.url vehicle_no_url(vehicle_no, format: :json)
end
