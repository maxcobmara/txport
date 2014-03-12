class VehicleFine < ActiveRecord::Base
 validates_presence_of :code, :type_id, :issued_at, :pay_before, :compound
 
 belongs_to :vehicle
 belongs_to :vehicle_fine_type, :foreign_key => "type_id"
 
 def table_status
   if pay_before == nil
     ""
   elsif paid_on != nil
     "info" #paid
   elsif pay_before < Date.today
     "error" #overdue
   elsif pay_before < Date.today + 1.months
     "warning" #due
   else
     "success" #ok
   end
 end
 
 def payment_status
   if paid_amount == nil
     "Tiada Bayaran"
   elsif paid_amount < compound && paid_amount > 0 &&receipt_no.length > 1
     "Diskaun"
   elsif paid_amount == compound && receipt_no.length > 1
     "Bayaran Penuh"
   elsif paid_amount = 0 && receipt_no.length > 1
     "Dikecualikan"     
   end
 end
 
 def self.to_csv(options = {})
   CSV.generate(options) do |csv|
    csv << column_names
    all.each do |vehicle_fine|
      csv << vehicle_fine.attributes.values_at(*column_names)
   end
 end
 end

end
