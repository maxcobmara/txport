class VehicleAssignment < ActiveRecord::Base
  belongs_to :authoriser, class_name: "Staff", foreign_key: "authorised_by"
  
  has_many :vehicle_assignment_details#, :foreign_key => 'vehicle_assignment_id' 
  accepts_nested_attributes_for :vehicle_assignment_details, allow_destroy: true, reject_if: proc { |vehicle_assignment_details| vehicle_assignment_details[:vehicle_id].blank? }
end
