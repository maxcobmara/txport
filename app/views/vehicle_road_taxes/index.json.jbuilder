json.array!(@vehicle_road_taxes) do |vehicle_road_tax|
  json.extract! vehicle_road_tax, :vehicle_id, :start_on, :end_on, :amount
  json.url vehicle_road_tax_url(vehicle_road_tax, format: :json)
end
