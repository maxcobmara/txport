class VehicleRoadTax < ActiveRecord::Base
  
	belongs_to :vehicle
  validates_presence_of :vehicle_id
  
  def status
    if end_on == nil
      ""
    elsif end_on < Date.today
      "error" #overdue
    elsif end_on < Date.today + 45.days
      "warning" #due
    else
      "success" #ok
    end
  end
  

end

# == Schema Information
#
# Table name: vehicle_road_taxes
#
#  amount     :decimal(, )
#  created_at :datetime
#  end_on     :date
#  id         :integer          not null, primary key
#  start_on   :date
#  updated_at :datetime
#  vehicle_id :integer
#
