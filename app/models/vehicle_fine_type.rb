class VehicleFineType < ActiveRecord::Base
  has_many :vehicle_fines, :foreign_key => "type_id"
  
  def self.get_type(fine_issuer)
	 where('short_name ILIKE (?)', "%#{fine_issuer}%")[0].id
  end
  
end
