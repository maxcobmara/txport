class AcquiredType < ActiveRecord::Base
  has_many :vehicles
  
  def self.get_acquired(fr_excel)
    AcquiredType.all.each do |acquired|
      if fr_excel.size > 12
        return acquired.id if fr_excel == acquired.description
      else 
        return acquired.id if fr_excel == acquired.short_name 
      end
    end
  end
  
end
