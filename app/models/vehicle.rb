class Vehicle < ActiveRecord::Base
  validates_presence_of :reg_no
  validates_uniqueness_of :reg_no
  validates_uniqueness_of :chassis_no,  :allow_nil => true, :allow_blank => true
  validates_uniqueness_of :engine_no,   :allow_nil => true, :allow_blank => true
  
  has_many :vehicle_road_taxes, :dependent => :destroy
  has_many :vehicle_fines,      :dependent => :destroy   
  has_many :maintenances,       :dependent => :destroy
  belongs_to :card,     :class_name => "VehicleCard",     :foreign_key => "vehicle_id"
  belongs_to :status,   :class_name => "VehicleStatus",   :foreign_key => "status_id"
  
  
  
  def self.search(search)
    if search
      where('reg_no ILIKE ?', "%#{search}%")
    else
      scoped
    end
  end
      
  
  
  
end
