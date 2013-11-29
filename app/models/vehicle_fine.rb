class VehicleFine < ActiveRecord::Base
 belongs_to :vehicle
 belongs_to :finetype,     :class_name => "VehicleFineType",     :foreign_key => "type_id"
end
