class VehicleAssignment < ActiveRecord::Base
  belongs_to :authoriser, class_name: "Staff", foreign_key: "authorised_by"
  belongs_to :unit_receiver, class_name: "Unit", foreign_key: "unit_id"
  has_many :vehicle_assignment_details
  accepts_nested_attributes_for :vehicle_assignment_details, allow_destroy: true, reject_if: proc { |vehicle_assignment_details| vehicle_assignment_details[:vehicle_id].blank? }
  validates_associated :vehicle_assignment_details
  validates_presence_of :document_code, :unit_id
  
  def authoriser_staff_details
	authoriser.try(:staff_details)
  end
  
  def authoriser_staff_details=(staff_details)
    staffname = staff_details.split(" ",2)[1] 
	self.authoriser = Staff.find_by_name(staffname) if staffname.present?
	#idno=staff_details.split(" ",2)[0] 
	#self.authoriser = Staff.find_by_id_no(idno) if idno.present?
  end
end
