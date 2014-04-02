class VehicleFineType < ActiveRecord::Base
  has_many :vehicle_fines, :foreign_key => "type_id"
  
  def self.get_type(fine_issuer)
	 where('short_name ILIKE (?)', "%#{fine_issuer}%")[0].id
  end
  
end

# == Schema Information
#
# Table name: vehicle_fine_types
#
#  created_at  :datetime
#  description :string(255)
#  id          :integer          not null, primary key
#  short_name  :string(255)
#  updated_at  :datetime
#
