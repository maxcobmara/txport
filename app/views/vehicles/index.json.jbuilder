json.array!(@vehicles) do |vehicle|
  json.extract! vehicle, :reg_no, :chassis_no, :engine_no, :reg_on, :manufacturer_year, :manufacturer_id, :model, :category_id, :aquired_on, :price, :contract_id, :status_id
  json.url vehicle_url(vehicle, format: :json)
end
