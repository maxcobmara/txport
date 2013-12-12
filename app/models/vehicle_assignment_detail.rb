class VehicleAssignmentDetail < ActiveRecord::Base
  belongs_to :vehicle_assignment, :foreign_key => 'vehicle_assignment_id'
  belongs_to :vehicle, :foreign_key => 'vehicle_id'
end