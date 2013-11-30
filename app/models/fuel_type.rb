class FuelType < ActiveRecord::Base
  has_many :fuel_tanks, :foreign_key => "fuel_type_id"
end
