class FuelTank < ActiveRecord::Base
  belongs_to :unit,   :class_name => "Unit",   :foreign_key => "unit_id"
  belongs_to :unit_type,   :class_name => "UnitType",   :foreign_key => "unit_type"
  belongs_to :fuel_type,   :class_name => "FuelType",   :foreign_key => "fuel_type_id"
end
