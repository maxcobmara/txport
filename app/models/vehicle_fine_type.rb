class VehicleFineType < ActiveRecord::Base
  has_many :vehicle_fines, :foreign_key => "type_id"
end
