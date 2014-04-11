class VehicleArmy < ActiveRecord::Base
	has_many :vehicle_nos, :dependent => :destroy
end
