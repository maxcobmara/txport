json.array!(@maintenances) do |maintenance|
  json.extract! maintenance, :vehicle_id, :work_order_no, :contract_id, :repaired_by, :supplied_by
  json.url maintenance_url(maintenance, format: :json)
end
