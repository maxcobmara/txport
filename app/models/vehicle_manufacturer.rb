class VehicleManufacturer < ActiveRecord::Base
 has_many :vehicles
 
 def self.get_manufacturer(fr_excel)
   #manufacturers = where('name ILIKE (?)',fr_excel[0,4])
   manufacturers = where('name ILIKE (?)',fr_excel.split[0])
   if manufacturers.count>0
     return manufacturers[0].id
   end
 end
 
end
