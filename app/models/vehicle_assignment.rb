class VehicleAssignment < ActiveRecord::Base
  has_many :vehicle_assignment_details, :foreign_key => 'vehicle_assignment_id' 
  accepts_nested_attributes_for :vehicle_assignment_details, allow_destroy: true
end
