class Unit < ActiveRecord::Base
  has_many :fuel_tanks, :foreign_key => "unit_id"
end
