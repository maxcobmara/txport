class MaintenanceType < ActiveRecord::Base
  has_many :maintenance_details
 
  def self.get_type(fr_excel,arr_fr_excel)
    mainttypes=where('type_name ILIKE (?)',fr_excel.squeeze(" ").strip)
    if mainttypes.count > 0
      return mainttypes[0].id
    else
      unless arr_fr_excel.include?(fr_excel)
        mainttype = find_by_type_name(fr_excel) || new 
        mainttype.type_name = fr_excel 
        mainttype.save!
        return mainttype.id
      end
    end
  end
  
end
