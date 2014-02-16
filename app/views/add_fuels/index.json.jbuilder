json.array!(@add_fuels) do |add_fuel|
  json.extract! add_fuel, :unit_fuel_id, :fuel_type_id, :description, :quantity, :unit_type_id
  json.url add_fuel_url(add_fuel, format: :json)
end
