class VehicleStatus < ActiveRecord::Base
  has_many :vehicles
  
  def self.get_status(fr_excel)
    VehicleStatus.all.each do |status|
      if fr_excel.size > 12
        return status.id if fr_excel == status.description
      else
        return status.id if fr_excel == status.short_name 
      end
    end
  end
  
end
