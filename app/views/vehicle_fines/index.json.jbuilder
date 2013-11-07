json.array!(@vehicle_fines) do |vehicle_fine|
  json.extract! vehicle_fine, :code, :vehicle_id, :type_id, :issued_at, :pay_before, :location, :reason, :compound, :receipt_no, :paid_on, :paid_amount
  json.url vehicle_fine_url(vehicle_fine, format: :json)
end
