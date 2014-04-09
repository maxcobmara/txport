class VehicleStatus < ActiveRecord::Base
  has_many :vehicles,       :foreign_key => "status_id"
  
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

# == Schema Information
#
# Table name: vehicle_statuses
#
#  created_at  :datetime
#  description :string(255)
#  id          :integer          not null, primary key
#  short_name  :string(12)
#  updated_at  :datetime
#
