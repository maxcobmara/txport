class VehicleAssignmentDetail < ActiveRecord::Base
  belongs_to :vehicle_assignment, :foreign_key => 'vehicle_assignment_id'
end