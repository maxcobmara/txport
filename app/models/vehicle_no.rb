class VehicleNo < ActiveRecord::Base
	belongs_to :vehicle, :foreign_key => "vehicle_id"
	belongs_to :vehicle_army, :foreign_key => "vehicle_army_id"
	validates_presence_of :vehicle_id, :vehicle_army_id
end
