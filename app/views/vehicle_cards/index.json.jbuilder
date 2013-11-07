json.array!(@vehicle_cards) do |vehicle_card|
  json.extract! vehicle_card, :vehicle_id, :serial_no
  json.url vehicle_card_url(vehicle_card, format: :json)
end
