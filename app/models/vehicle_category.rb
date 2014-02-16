class VehicleCategory < ActiveRecord::Base
  has_many :vehicles
  
  def self.get_category(fr_excel)
    VehicleCategory.all.each do |category|
      if fr_excel.size > 12
        return category.id if fr_excel == category.description
      else
        return category.id if fr_excel == category.short_name 
      end
    end
  end
end
