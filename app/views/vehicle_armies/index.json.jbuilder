json.array!(@vehicle_armies) do |vehicle_army|
  json.extract! vehicle_army, :v_army_no
  json.url vehicle_army_url(vehicle_army, format: :json)
end
