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
