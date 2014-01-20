class VehicleRoadTax < ActiveRecord::Base
	belongs_to :vehicle
  
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
