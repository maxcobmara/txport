class UnitFuel < ActiveRecord::Base
  before_save :set_default_value
  belongs_to :unit, :foreign_key => "unit_id"
  has_many :add_fuels, dependent: :destroy
  accepts_nested_attributes_for :add_fuels, allow_destroy: true, reject_if: proc { |add_fuels| add_fuels[:quantity].blank? }
  
  def set_default_value
    self.d_vessel = 0 if d_vessel.blank?
    self.d_vehicle = 0 if d_vehicle.blank?
    self.d_misctool = 0 if d_misctool.blank?
    self.d_boat = 0 if d_boat.blank?
    self.p_vehicle = 0 if p_vehicle.blank?
    self.p_misctool = 0 if p_misctool.blank?
    self.p_boat = 0 if p_boat.blank?
  end 
  
  def month_unit
    "#{unit.name} "+"#{issue_date.strftime("%b")} "+"#{issue_date.year}"
  end 
  
  def self.diesel_usage(unit_fuel)
    return (unit_fuel.d_vessel+unit_fuel.d_vehicle+unit_fuel.d_misctool+unit_fuel.d_boat).to_i.to_s+" LTR"
  end
  
  def self.petrol_usage(unit_fuel)
    return (unit_fuel.p_vehicle+unit_fuel.p_misctool+unit_fuel.p_boat).to_i.to_s+" LTR"
  end  
  
end
