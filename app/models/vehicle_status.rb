class VehicleStatus < ActiveRecord::Base
  has_many :vehicles, :foreign_key => "status_id"
end
