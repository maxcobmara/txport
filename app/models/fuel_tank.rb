class FuelTank < ActiveRecord::Base
  belongs_to :unit,   :class_name => "Unit",   :foreign_key => "unit_id"
  belongs_to :unittype,   :class_name => "UnitType",   :foreign_key => "unit_type"
  belongs_to :fuel_type,   :class_name => "FuelType",   :foreign_key => "fuel_type_id"
  has_many :fuel_balances, dependent: :destroy
  
  def fuel_tank_type
    "#{locations}"+" - #{fuel_type.name}"
  end
  
  def fuel_tank_details
    "#{unit.name}"+" | "+fuel_tank_type
  end
  
end
