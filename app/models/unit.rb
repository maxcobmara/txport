class Unit < ActiveRecord::Base
  before_save :set_combo_code
  has_ancestry :cache_depth => true
  
  has_many :fuel_tanks, :foreign_key => "unit_id"
  has_many :subunits, class_name: "Unit", foreign_key: 'parent_id'
  belongs_to :parent, class_name: "Unit", foreign_key: 'parent_id'
  has_many :vehicle_cards, dependent: :nullify
  has_many :depot_fuels #only for depot (unit having fuel tanks)
  
  def set_combo_code
    if ancestry_depth == 0
      self.combo_code = code
    elsif ancestry_depth == 1 || ancestry_depth == 2 || ancestry_depth == 3 || ancestry_depth == 4
      self.combo_code = parent.combo_code + "-" + code
    else
      self.combo_code = parent.combo_code + code
    end
  end
  
  def unit_details
    "#{shortname} " + "#{name}"
  end
end
