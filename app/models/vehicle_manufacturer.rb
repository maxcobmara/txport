class VehicleManufacturer < ActiveRecord::Base
 has_many :vehicles
 
 def self.get_manufacturer(fr_excel)
   #manufacturers = where('name ILIKE (?)',fr_excel[0,4])
   #manufacturers = where('name ILIKE (?)',fr_excel.split[0])
   #if manufacturers.count>0
     #return manufacturers[0].id
   #end
   #"%#{fr_excel}%"
   where('name ILIKE (?)', "%#{fr_excel}%")[0].id
   #where('name ILIKE (?)', "%mercedes-benz%")[0].id
 end
 ##"#{}"
end

# == Schema Information
#
# Table name: vehicle_manufacturers
#
#  country    :string(255)
#  created_at :datetime
#  id         :integer          not null, primary key
#  name       :string(255)
#  updated_at :datetime
#
