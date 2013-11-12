class VehicleCard < ActiveRecord::Base
	has_many :vehicles, :foreign_key => "vehicle_id"

end
