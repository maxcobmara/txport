class VehicleCard < ActiveRecord::Base
	#has_many :vehicles, :foreign_key => "vehicle_id"
  belongs_to :vehicle, foreign_key: "vehicle_id"
  belongs_to :card_holder, class_name: "Staff", foreign_key: "staff_id"
  belongs_to :unit, foreign_key: "unit_id"
  
  validates_presence_of :staff_id
end
