class VehicleFine < ActiveRecord::Base
  validates_presence_of :code, :type_id, :issued_at, :pay_before, :compound
 
 belongs_to :vehicle
 belongs_to :vehicle_fine_type, :foreign_key => "type_id"
 
 def status
   if paid_on != nil
     "info" #paid
   elsif pay_before < Date.today
     "error" #overdue
   elsif pay_before < Date.today + 1.months
     "warning" #due
   else
     "success" #ok
   end
 end

end
