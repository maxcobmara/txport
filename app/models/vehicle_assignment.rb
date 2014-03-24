class VehicleAssignment < ActiveRecord::Base
  belongs_to :authoriser, class_name: "Staff", foreign_key: "authorised_by"
  belongs_to :unit_receiver, class_name: "Unit", foreign_key: "unit_id"
  has_many :vehicle_assignment_details
  accepts_nested_attributes_for :vehicle_assignment_details, allow_destroy: true, reject_if: proc { |vehicle_assignment_details| vehicle_assignment_details[:vehicle_id].blank? }
  validates_associated :vehicle_assignment_details
  validates_presence_of :document_code, :unit_id
end
