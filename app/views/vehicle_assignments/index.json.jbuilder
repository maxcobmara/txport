json.array!(@vehicle_assignments) do |vehicle_assignment|
  json.extract! vehicle_assignment, :vehicle_id, :staff_id, :assigned_on, :assignment_end
  json.url vehicle_assignment_url(vehicle_assignment, format: :json)
end
