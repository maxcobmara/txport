class VehicleRoadTax < ActiveRecord::Base
	belongs_to :vehicle
  
  def status
    if end_on < Date.today
      "error"
    elsif end_on < Date.today + 3.months
      "warning"
    else
      "success"
    end
  end
end
