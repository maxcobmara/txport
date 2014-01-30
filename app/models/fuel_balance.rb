class FuelBalance < ActiveRecord::Base
  belongs_to :depot_fuel, :foreign_key => "depot_fuel_id"
  belongs_to :fuel_tank, :foreign_key => "fuel_tank_id"
  belongs_to :unit_type, :foreign_key => "unit_type_id"
end
