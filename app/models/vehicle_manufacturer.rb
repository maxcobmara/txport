class VehicleManufacturer < ActiveRecord::Base
 has_many :vehicles, :foreign_key => "manufacturer_id"
end
