class UnitType < ActiveRecord::Base
  has_many :fuel_tanks, :foreign_key => "unit_type"
end
