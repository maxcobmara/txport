class VehicleRoadTax < ActiveRecord::Base
	belongs_to :vehicle
  
  def status
    if end_on < Date.today
      "error" #overdue
    elsif end_on < Date.today + 3.months
      "warning" #due
    else
      "success" #ok
    end
  end
end
